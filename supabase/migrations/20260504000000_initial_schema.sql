-- ============================================================
-- CoachConnect — Schéma complet de la base de données
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ============================================================
-- FONCTION UTILITAIRE : mise à jour automatique de updated_at
-- ============================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- TABLE: profiles
-- ============================================================
CREATE TABLE IF NOT EXISTS public.profiles (
  id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID        UNIQUE NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name    TEXT,
  avatar_url      TEXT,
  fitness_goal    TEXT,
  fitness_level   TEXT        CHECK (fitness_level IN ('debutant', 'intermediaire', 'avance')),
  preferred_format TEXT       CHECK (preferred_format IN ('solo', 'duo', 'trio', 'groupe', 'max')),
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "profiles_select_public"
  ON public.profiles FOR SELECT USING (true);

CREATE POLICY "profiles_insert_own"
  ON public.profiles FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "profiles_update_own"
  ON public.profiles FOR UPDATE USING (auth.uid() = user_id);

CREATE TRIGGER trg_profiles_updated_at
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- TABLE: coaches
-- ============================================================
CREATE TABLE IF NOT EXISTS public.coaches (
  id               UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
  name             TEXT         NOT NULL,
  bio              TEXT,
  city             TEXT         NOT NULL,
  image_url        TEXT,
  price_solo       NUMERIC(10,2) NOT NULL DEFAULT 0,
  rating           NUMERIC(3,2) NOT NULL DEFAULT 0,
  review_count     INT          NOT NULL DEFAULT 0,
  experience_years INT,
  certified        BOOLEAN      NOT NULL DEFAULT true,
  online           BOOLEAN      NOT NULL DEFAULT false,
  specialties      TEXT[]       NOT NULL DEFAULT '{}',
  pricing          JSONB        NOT NULL DEFAULT '[]',
  availability     JSONB        NOT NULL DEFAULT '[]',
  created_at       TIMESTAMPTZ  NOT NULL DEFAULT now(),
  updated_at       TIMESTAMPTZ  NOT NULL DEFAULT now()
);

ALTER TABLE public.coaches ENABLE ROW LEVEL SECURITY;

CREATE POLICY "coaches_select_public"
  ON public.coaches FOR SELECT USING (true);

CREATE TRIGGER trg_coaches_updated_at
  BEFORE UPDATE ON public.coaches
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- TABLE: bookings
-- ============================================================
CREATE TABLE IF NOT EXISTS public.bookings (
  id               UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
  coach_id         UUID         NOT NULL REFERENCES public.coaches(id) ON DELETE RESTRICT,
  host_user_id     UUID         NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  format           TEXT         NOT NULL CHECK (format IN ('solo', 'duo', 'trio', 'groupe', 'max')),
  max_participants INT          NOT NULL DEFAULT 1,
  price_per_person NUMERIC(10,2) NOT NULL,
  total_amount     NUMERIC(10,2) NOT NULL,
  scheduled_at     TIMESTAMPTZ  NOT NULL,
  duration_minutes INT          NOT NULL DEFAULT 60,
  status           TEXT         NOT NULL DEFAULT 'pending'
                                CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
  notes            TEXT,
  created_at       TIMESTAMPTZ  NOT NULL DEFAULT now(),
  updated_at       TIMESTAMPTZ  NOT NULL DEFAULT now()
);

ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "bookings_select_own"
  ON public.bookings FOR SELECT USING (auth.uid() = host_user_id);

CREATE POLICY "bookings_insert_own"
  ON public.bookings FOR INSERT WITH CHECK (auth.uid() = host_user_id);

CREATE POLICY "bookings_update_own"
  ON public.bookings FOR UPDATE USING (auth.uid() = host_user_id);

CREATE TRIGGER trg_bookings_updated_at
  BEFORE UPDATE ON public.bookings
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- TABLE: booking_participants
-- ============================================================
CREATE TABLE IF NOT EXISTS public.booking_participants (
  id         UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id UUID        NOT NULL REFERENCES public.bookings(id) ON DELETE CASCADE,
  user_id    UUID        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  joined_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(booking_id, user_id)
);

ALTER TABLE public.booking_participants ENABLE ROW LEVEL SECURITY;

CREATE POLICY "booking_participants_select_own"
  ON public.booking_participants FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "booking_participants_insert_own"
  ON public.booking_participants FOR INSERT WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- TABLE: reviews
-- ============================================================
CREATE TABLE IF NOT EXISTS public.reviews (
  id         UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  coach_id   UUID        NOT NULL REFERENCES public.coaches(id) ON DELETE CASCADE,
  user_id    UUID        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  booking_id UUID        REFERENCES public.bookings(id) ON DELETE SET NULL,
  rating     INT         NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment    TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(user_id, coach_id, booking_id)
);

ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

CREATE POLICY "reviews_select_public"
  ON public.reviews FOR SELECT USING (true);

CREATE POLICY "reviews_insert_own"
  ON public.reviews FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "reviews_update_own"
  ON public.reviews FOR UPDATE USING (auth.uid() = user_id);

-- Recalcul automatique du rating du coach après chaque avis
CREATE OR REPLACE FUNCTION update_coach_rating()
RETURNS TRIGGER AS $$
DECLARE
  target_coach_id UUID;
BEGIN
  target_coach_id := COALESCE(NEW.coach_id, OLD.coach_id);
  UPDATE public.coaches
  SET
    rating       = COALESCE((SELECT ROUND(AVG(rating)::NUMERIC, 2) FROM public.reviews WHERE coach_id = target_coach_id), 0),
    review_count = (SELECT COUNT(*) FROM public.reviews WHERE coach_id = target_coach_id)
  WHERE id = target_coach_id;
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_coach_rating
  AFTER INSERT OR UPDATE OR DELETE ON public.reviews
  FOR EACH ROW EXECUTE FUNCTION update_coach_rating();

-- ============================================================
-- TABLE: user_stats
-- ============================================================
CREATE TABLE IF NOT EXISTS public.user_stats (
  id                 UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id            UUID        UNIQUE NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  streak_days        INT         NOT NULL DEFAULT 0,
  sessions_completed INT         NOT NULL DEFAULT 0,
  badges             TEXT[]      NOT NULL DEFAULT '{}',
  last_session_at    TIMESTAMPTZ,
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.user_stats ENABLE ROW LEVEL SECURITY;

CREATE POLICY "user_stats_select_own"
  ON public.user_stats FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "user_stats_update_own"
  ON public.user_stats FOR UPDATE USING (auth.uid() = user_id);

CREATE TRIGGER trg_user_stats_updated_at
  BEFORE UPDATE ON public.user_stats
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- TABLE: payments
-- ============================================================
CREATE TABLE IF NOT EXISTS public.payments (
  id             UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id     UUID         NOT NULL REFERENCES public.bookings(id) ON DELETE RESTRICT,
  user_id        UUID         NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  amount         NUMERIC(10,2) NOT NULL,
  currency       TEXT         NOT NULL DEFAULT 'MAD',
  status         TEXT         NOT NULL DEFAULT 'pending'
                              CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
  payment_method TEXT,
  transaction_id TEXT,
  paid_at        TIMESTAMPTZ,
  created_at     TIMESTAMPTZ  NOT NULL DEFAULT now()
);

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;

CREATE POLICY "payments_select_own"
  ON public.payments FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "payments_insert_own"
  ON public.payments FOR INSERT WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- TRIGGER: Création automatique profil + user_stats à l'inscription
-- ============================================================
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (user_id, display_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  )
  ON CONFLICT (user_id) DO NOTHING;

  INSERT INTO public.user_stats (user_id)
  VALUES (NEW.id)
  ON CONFLICT (user_id) DO NOTHING;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

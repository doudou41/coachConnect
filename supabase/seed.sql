-- ============================================================
-- CoachConnect — Seed Data
-- 10 utilisateurs + 6 coachs + bookings + avis + stats + paiements
-- Mot de passe pour tous les users : Test1234!
-- ============================================================

-- ============================================================
-- 1. UTILISATEURS AUTH (insérés directement dans auth.users)
--    Le trigger on_auth_user_created créera automatiquement
--    les entrées dans profiles et user_stats.
-- ============================================================

INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, raw_app_meta_data, raw_user_meta_data,
  created_at, updated_at,
  confirmation_token, email_change, email_change_token_new, recovery_token
) VALUES
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0001-0001-0001-000000000001',
    'authenticated', 'authenticated',
    'user1@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Ahmed Benali"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0002-0002-0002-000000000002',
    'authenticated', 'authenticated',
    'user2@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Fatima Zahra El Idrissi"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0003-0003-0003-000000000003',
    'authenticated', 'authenticated',
    'user3@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Youssef Alami"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0004-0004-0004-000000000004',
    'authenticated', 'authenticated',
    'user4@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Khadija Tazi"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0005-0005-0005-000000000005',
    'authenticated', 'authenticated',
    'user5@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Mohammed Chraibi"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0006-0006-0006-000000000006',
    'authenticated', 'authenticated',
    'user6@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Nour El Houda Bennis"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0007-0007-0007-000000000007',
    'authenticated', 'authenticated',
    'user7@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Hamid Lahlou"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0008-0008-0008-000000000008',
    'authenticated', 'authenticated',
    'user8@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Zineb Fassi"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0009-0009-0009-000000000009',
    'authenticated', 'authenticated',
    'user9@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Khalid Berrada"}',
    now(), now(), '', '', '', ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    'aaaaaaaa-0010-0010-0010-000000000010',
    'authenticated', 'authenticated',
    'user10@coachconnect.ma',
    crypt('Test1234!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"]}',
    '{"full_name":"Samira Bensouda"}',
    now(), now(), '', '', '', ''
  );

-- ============================================================
-- 2. MISE À JOUR DES PROFILS
--    (le trigger a déjà créé les lignes, on les enrichit)
-- ============================================================

UPDATE public.profiles SET
  fitness_goal = 'Perte de poids', fitness_level = 'debutant', preferred_format = 'solo'
WHERE user_id = 'aaaaaaaa-0001-0001-0001-000000000001';

UPDATE public.profiles SET
  fitness_goal = 'Tonification', fitness_level = 'intermediaire', preferred_format = 'duo'
WHERE user_id = 'aaaaaaaa-0002-0002-0002-000000000002';

UPDATE public.profiles SET
  fitness_goal = 'Prise de masse', fitness_level = 'avance', preferred_format = 'solo'
WHERE user_id = 'aaaaaaaa-0003-0003-0003-000000000003';

UPDATE public.profiles SET
  fitness_goal = 'Bien-être et relaxation', fitness_level = 'debutant', preferred_format = 'groupe'
WHERE user_id = 'aaaaaaaa-0004-0004-0004-000000000004';

UPDATE public.profiles SET
  fitness_goal = 'Performance sportive', fitness_level = 'avance', preferred_format = 'solo'
WHERE user_id = 'aaaaaaaa-0005-0005-0005-000000000005';

UPDATE public.profiles SET
  fitness_goal = 'Remise en forme', fitness_level = 'intermediaire', preferred_format = 'trio'
WHERE user_id = 'aaaaaaaa-0006-0006-0006-000000000006';

UPDATE public.profiles SET
  fitness_goal = 'Flexibilité', fitness_level = 'debutant', preferred_format = 'duo'
WHERE user_id = 'aaaaaaaa-0007-0007-0007-000000000007';

UPDATE public.profiles SET
  fitness_goal = 'Perte de poids', fitness_level = 'intermediaire', preferred_format = 'max'
WHERE user_id = 'aaaaaaaa-0008-0008-0008-000000000008';

UPDATE public.profiles SET
  fitness_goal = 'Nutrition et diète', fitness_level = 'debutant', preferred_format = 'solo'
WHERE user_id = 'aaaaaaaa-0009-0009-0009-000000000009';

UPDATE public.profiles SET
  fitness_goal = 'Musculation et force', fitness_level = 'avance', preferred_format = 'solo'
WHERE user_id = 'aaaaaaaa-0010-0010-0010-000000000010';

-- ============================================================
-- 3. COACHS (6 coachs depuis coaches.ts)
-- ============================================================

INSERT INTO public.coaches (id, name, bio, city, image_url, price_solo, rating, review_count, experience_years, certified, online, specialties, pricing, availability)
VALUES
  (
    'bbbbbbbb-0001-0001-0001-000000000001',
    'Karim Alaoui',
    'Coach certifié CF-L2 avec 8 ans d''expérience. Spécialisé dans la transformation physique et la préparation athlétique. Ancien athlète national de CrossFit.',
    'Casablanca',
    'https://images.unsplash.com/photo-1567013127542-490d483bf823?w=400&h=400&fit=crop&crop=face',
    400.00,
    4.9,
    127,
    8,
    true,
    false,
    ARRAY['Musculation', 'HIIT', 'CrossFit'],
    '[
      {"format":"Solo",   "people":1, "pricePerPerson":400, "coachRevenue":400, "savings":"—"},
      {"format":"Duo",    "people":2, "pricePerPerson":300, "coachRevenue":600, "savings":"-25%"},
      {"format":"Trio",   "people":3, "pricePerPerson":220, "coachRevenue":660, "savings":"-45%"},
      {"format":"Groupe", "people":4, "pricePerPerson":180, "coachRevenue":720, "savings":"-55%"},
      {"format":"Max",    "people":5, "pricePerPerson":150, "coachRevenue":750, "savings":"-63%"}
    ]'::jsonb,
    '["Lun 8h-12h","Mar 14h-19h","Mer 8h-18h","Ven 9h-15h","Sam 8h-13h"]'::jsonb
  ),
  (
    'bbbbbbbb-0002-0002-0002-000000000002',
    'Salma Idrissi',
    'Instructrice RYT-500, formée en Inde. Je propose des séances de yoga adaptées à tous les niveaux, du débutant à l''avancé. Spécialiste en yoga thérapeutique.',
    'Casablanca',
    'https://images.unsplash.com/photo-1594381898411-846e7d193883?w=400&h=400&fit=crop&crop=face',
    350.00,
    4.8,
    203,
    6,
    true,
    true,
    ARRAY['Yoga', 'Pilates', 'Méditation'],
    '[
      {"format":"Solo",   "people":1, "pricePerPerson":350, "coachRevenue":350, "savings":"—"},
      {"format":"Duo",    "people":2, "pricePerPerson":260, "coachRevenue":520, "savings":"-26%"},
      {"format":"Trio",   "people":3, "pricePerPerson":200, "coachRevenue":600, "savings":"-43%"},
      {"format":"Groupe", "people":4, "pricePerPerson":160, "coachRevenue":640, "savings":"-54%"},
      {"format":"Max",    "people":5, "pricePerPerson":130, "coachRevenue":650, "savings":"-63%"}
    ]'::jsonb,
    '["Lun 7h-11h","Mar 7h-11h","Jeu 16h-20h","Sam 9h-14h","Dim 8h-12h"]'::jsonb
  ),
  (
    'bbbbbbbb-0003-0003-0003-000000000003',
    'Omar Fassi',
    'Ancien boxeur professionnel, brevet d''État Boxe française. Entraîneur passionné par le dépassement de soi. Ambiance intense garantie.',
    'Casablanca',
    'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=400&h=400&fit=crop&crop=face',
    350.00,
    4.7,
    89,
    10,
    true,
    false,
    ARRAY['Boxe', 'Cross Training'],
    '[
      {"format":"Solo",   "people":1, "pricePerPerson":350, "coachRevenue":350, "savings":"—"},
      {"format":"Duo",    "people":2, "pricePerPerson":260, "coachRevenue":520, "savings":"-26%"},
      {"format":"Trio",   "people":3, "pricePerPerson":195, "coachRevenue":585, "savings":"-44%"},
      {"format":"Groupe", "people":4, "pricePerPerson":155, "coachRevenue":620, "savings":"-56%"},
      {"format":"Max",    "people":5, "pricePerPerson":130, "coachRevenue":650, "savings":"-63%"}
    ]'::jsonb,
    '["Mar 9h-13h","Mer 15h-20h","Jeu 9h-13h","Ven 15h-20h","Sam 10h-15h"]'::jsonb
  ),
  (
    'bbbbbbbb-0004-0004-0004-000000000004',
    'Nadia Berrada',
    'Nutritionniste diplômée DIETECOM, spécialisée en nutrition sportive. Consultations 100% en ligne. Plans alimentaires personnalisés et suivi hebdomadaire.',
    'En ligne',
    'https://images.unsplash.com/photo-1607746882042-944635dfe10e?w=400&h=400&fit=crop&crop=face',
    200.00,
    5.0,
    312,
    5,
    true,
    true,
    ARRAY['Nutrition', 'Diététique'],
    '[
      {"format":"Solo",   "people":1, "pricePerPerson":200, "coachRevenue":200, "savings":"—"},
      {"format":"Duo",    "people":2, "pricePerPerson":150, "coachRevenue":300, "savings":"-25%"},
      {"format":"Trio",   "people":3, "pricePerPerson":120, "coachRevenue":360, "savings":"-40%"},
      {"format":"Groupe", "people":4, "pricePerPerson":100, "coachRevenue":400, "savings":"-50%"},
      {"format":"Max",    "people":5, "pricePerPerson": 85, "coachRevenue":425, "savings":"-58%"}
    ]'::jsonb,
    '["Lun-Ven 9h-18h","Sam 10h-14h"]'::jsonb
  ),
  (
    'bbbbbbbb-0005-0005-0005-000000000005',
    'Yassine Tazi',
    'Coach ISSA certifié, passionné de powerlifting. Je vous accompagne vers vos objectifs de force avec des programmes structurés et un suivi rigoureux.',
    'Rabat',
    'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400&h=400&fit=crop&crop=face',
    450.00,
    4.6,
    64,
    7,
    true,
    true,
    ARRAY['Powerlifting', 'Musculation'],
    '[
      {"format":"Solo",   "people":1, "pricePerPerson":450, "coachRevenue":450, "savings":"—"},
      {"format":"Duo",    "people":2, "pricePerPerson":340, "coachRevenue":680, "savings":"-24%"},
      {"format":"Trio",   "people":3, "pricePerPerson":250, "coachRevenue":750, "savings":"-44%"},
      {"format":"Groupe", "people":4, "pricePerPerson":200, "coachRevenue":800, "savings":"-56%"},
      {"format":"Max",    "people":5, "pricePerPerson":170, "coachRevenue":850, "savings":"-62%"}
    ]'::jsonb,
    '["Lun 14h-20h","Mer 8h-14h","Jeu 14h-20h","Sam 9h-16h"]'::jsonb
  ),
  (
    'bbbbbbbb-0006-0006-0006-000000000006',
    'Aicha Bensouda',
    'Instructrice Zumba licenciée, danseuse professionnelle. Mes cours allient fun et fitness dans une ambiance festive. Disponible en présentiel et en ligne.',
    'Marrakech',
    'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&h=400&fit=crop&crop=face',
    280.00,
    4.9,
    178,
    4,
    true,
    true,
    ARRAY['Zumba', 'Danse Fitness'],
    '[
      {"format":"Solo",   "people":1, "pricePerPerson":280, "coachRevenue":280, "savings":"—"},
      {"format":"Duo",    "people":2, "pricePerPerson":210, "coachRevenue":420, "savings":"-25%"},
      {"format":"Trio",   "people":3, "pricePerPerson":160, "coachRevenue":480, "savings":"-43%"},
      {"format":"Groupe", "people":4, "pricePerPerson":130, "coachRevenue":520, "savings":"-54%"},
      {"format":"Max",    "people":5, "pricePerPerson":110, "coachRevenue":550, "savings":"-61%"}
    ]'::jsonb,
    '["Lun 17h-21h","Mar 10h-14h","Jeu 17h-21h","Sam 10h-16h","Dim 10h-14h"]'::jsonb
  );

-- ============================================================
-- 4. BOOKINGS (15 réservations, mix de statuts et formats)
-- ============================================================

INSERT INTO public.bookings (id, coach_id, host_user_id, format, max_participants, price_per_person, total_amount, scheduled_at, duration_minutes, status, notes)
VALUES
  -- Séances terminées (completed)
  ('cccccccc-0001-0001-0001-000000000001', 'bbbbbbbb-0001-0001-0001-000000000001', 'aaaaaaaa-0001-0001-0001-000000000001', 'solo',   1, 400.00, 400.00,  '2026-04-01 09:00:00+01', 60, 'completed', 'Séance découverte HIIT'),
  ('cccccccc-0002-0002-0002-000000000002', 'bbbbbbbb-0002-0002-0002-000000000002', 'aaaaaaaa-0004-0004-0004-000000000004', 'duo',    2, 260.00, 520.00,  '2026-04-05 10:00:00+01', 60, 'completed', 'Yoga débutant en duo'),
  ('cccccccc-0003-0003-0003-000000000003', 'bbbbbbbb-0004-0004-0004-000000000004', 'aaaaaaaa-0009-0009-0009-000000000009', 'solo',   1, 200.00, 200.00,  '2026-04-10 14:00:00+01', 45, 'completed', 'Consultation nutrition initiale'),
  ('cccccccc-0004-0004-0004-000000000004', 'bbbbbbbb-0005-0005-0005-000000000005', 'aaaaaaaa-0003-0003-0003-000000000003', 'solo',   1, 450.00, 450.00,  '2026-04-12 15:00:00+01', 90, 'completed', 'Programme powerlifting'),
  ('cccccccc-0005-0005-0005-000000000005', 'bbbbbbbb-0006-0006-0006-000000000006', 'aaaaaaaa-0008-0008-0008-000000000008', 'groupe', 4, 130.00, 520.00,  '2026-04-15 17:00:00+01', 60, 'completed', 'Cours Zumba en groupe'),
  ('cccccccc-0006-0006-0006-000000000006', 'bbbbbbbb-0003-0003-0003-000000000003', 'aaaaaaaa-0005-0005-0005-000000000005', 'solo',   1, 350.00, 350.00,  '2026-04-18 09:00:00+01', 60, 'completed', 'Initiation boxe'),

  -- Séances confirmées (confirmed)
  ('cccccccc-0007-0007-0007-000000000007', 'bbbbbbbb-0001-0001-0001-000000000001', 'aaaaaaaa-0002-0002-0002-000000000002', 'duo',    2, 300.00, 600.00,  '2026-05-10 08:00:00+01', 60, 'confirmed', 'CrossFit duo — programme 4 semaines'),
  ('cccccccc-0008-0008-0008-000000000008', 'bbbbbbbb-0002-0002-0002-000000000002', 'aaaaaaaa-0007-0007-0007-000000000007', 'trio',   3, 200.00, 600.00,  '2026-05-08 07:00:00+01', 75, 'confirmed', 'Yoga matinal trio'),
  ('cccccccc-0009-0009-0009-000000000009', 'bbbbbbbb-0004-0004-0004-000000000004', 'aaaaaaaa-0006-0006-0006-000000000006', 'solo',   1, 200.00, 200.00,  '2026-05-12 11:00:00+01', 45, 'confirmed', 'Bilan nutritionnel'),
  ('cccccccc-0010-0010-0010-000000000010', 'bbbbbbbb-0005-0005-0005-000000000005', 'aaaaaaaa-0010-0010-0010-000000000010', 'solo',   1, 450.00, 450.00,  '2026-05-14 16:00:00+01', 90, 'confirmed', 'Séance force maximale'),

  -- Séances en attente (pending)
  ('cccccccc-0011-0011-0011-000000000011', 'bbbbbbbb-0006-0006-0006-000000000006', 'aaaaaaaa-0004-0004-0004-000000000004', 'max',    5, 110.00, 550.00,  '2026-05-20 18:00:00+01', 60, 'pending',   'Cours Zumba max 5 pers'),
  ('cccccccc-0012-0012-0012-000000000012', 'bbbbbbbb-0001-0001-0001-000000000001', 'aaaaaaaa-0005-0005-0005-000000000005', 'trio',   3, 220.00, 660.00,  '2026-05-22 09:00:00+01', 60, 'pending',   'HIIT intensif trio'),
  ('cccccccc-0013-0013-0013-000000000013', 'bbbbbbbb-0003-0003-0003-000000000003', 'aaaaaaaa-0008-0008-0008-000000000008', 'duo',    2, 260.00, 520.00,  '2026-05-25 10:00:00+01', 60, 'pending',   'Cross Training cardio duo'),

  -- Séances annulées (cancelled)
  ('cccccccc-0014-0014-0014-000000000014', 'bbbbbbbb-0002-0002-0002-000000000002', 'aaaaaaaa-0001-0001-0001-000000000001', 'solo',   1, 350.00, 350.00,  '2026-04-20 07:00:00+01', 60, 'cancelled', 'Annulé par le client'),
  ('cccccccc-0015-0015-0015-000000000015', 'bbbbbbbb-0004-0004-0004-000000000004', 'aaaaaaaa-0003-0003-0003-000000000003', 'duo',    2, 150.00, 300.00,  '2026-04-28 14:00:00+01', 45, 'cancelled', 'Indisponibilité coach');

-- ============================================================
-- 5. BOOKING PARTICIPANTS (pour les sessions groupe)
-- ============================================================

-- Booking duo (user4 + user7 rejoignent)
INSERT INTO public.booking_participants (booking_id, user_id) VALUES
  ('cccccccc-0002-0002-0002-000000000002', 'aaaaaaaa-0007-0007-0007-000000000007');

-- Booking groupe Zumba (user1, user6, user9 rejoignent)
INSERT INTO public.booking_participants (booking_id, user_id) VALUES
  ('cccccccc-0005-0005-0005-000000000005', 'aaaaaaaa-0001-0001-0001-000000000001'),
  ('cccccccc-0005-0005-0005-000000000005', 'aaaaaaaa-0006-0006-0006-000000000006'),
  ('cccccccc-0005-0005-0005-000000000005', 'aaaaaaaa-0009-0009-0009-000000000009');

-- Booking duo CrossFit (user3 rejoint)
INSERT INTO public.booking_participants (booking_id, user_id) VALUES
  ('cccccccc-0007-0007-0007-000000000007', 'aaaaaaaa-0003-0003-0003-000000000003');

-- Booking trio Yoga (user2, user4 rejoignent)
INSERT INTO public.booking_participants (booking_id, user_id) VALUES
  ('cccccccc-0008-0008-0008-000000000008', 'aaaaaaaa-0002-0002-0002-000000000002'),
  ('cccccccc-0008-0008-0008-000000000008', 'aaaaaaaa-0004-0004-0004-000000000004');

-- ============================================================
-- 6. REVIEWS (12 avis sur les séances terminées)
--    Le trigger recalculera automatiquement rating + review_count
--    sur les coaches après ces inserts.
-- ============================================================

INSERT INTO public.reviews (coach_id, user_id, booking_id, rating, comment) VALUES
  -- Karim Alaoui
  ('bbbbbbbb-0001-0001-0001-000000000001', 'aaaaaaaa-0001-0001-0001-000000000001', 'cccccccc-0001-0001-0001-000000000001', 5, 'Séance incroyable ! Karim est très professionnel et sait exactement comment pousser ses clients. Je recommande vivement.'),
  ('bbbbbbbb-0001-0001-0001-000000000001', 'aaaaaaaa-0005-0005-0005-000000000005', NULL, 5, 'Le meilleur coach CrossFit de Casablanca. Programmes bien structurés et suivi personnalisé.'),
  ('bbbbbbbb-0001-0001-0001-000000000001', 'aaaaaaaa-0003-0003-0003-000000000003', NULL, 4, 'Très bon coach, exigeant mais bienveillant. Les résultats sont au rendez-vous après 3 mois.'),

  -- Salma Idrissi
  ('bbbbbbbb-0002-0002-0002-000000000002', 'aaaaaaaa-0004-0004-0004-000000000004', 'cccccccc-0002-0002-0002-000000000002', 5, 'Salma est une instructrice exceptionnelle. Sa pédagogie est parfaite pour les débutants. Je me sens tellement mieux après chaque séance.'),
  ('bbbbbbbb-0002-0002-0002-000000000002', 'aaaaaaaa-0007-0007-0007-000000000007', NULL, 5, 'Cours de yoga magnifiques, ambiance apaisante. Je recommande le cours du matin.'),
  ('bbbbbbbb-0002-0002-0002-000000000002', 'aaaaaaaa-0002-0002-0002-000000000002', NULL, 4, 'Très bonne coach, très douce et à l''écoute. Parfait pour débuter le yoga.'),

  -- Omar Fassi
  ('bbbbbbbb-0003-0003-0003-000000000003', 'aaaaaaaa-0005-0005-0005-000000000005', 'cccccccc-0006-0006-0006-000000000006', 5, 'Omar est un coach hors pair. Son expérience de boxeur professionnel transparaît dans ses cours. Très efficace.'),
  ('bbbbbbbb-0003-0003-0003-000000000003', 'aaaaaaaa-0008-0008-0008-000000000008', NULL, 4, 'Bonne séance, intense comme prévu ! Bon encadrement technique.'),

  -- Nadia Berrada
  ('bbbbbbbb-0004-0004-0004-000000000004', 'aaaaaaaa-0009-0009-0009-000000000009', 'cccccccc-0003-0003-0003-000000000003', 5, 'Nadia a complètement transformé mon alimentation. Plan personnalisé, suivi rigoureux, résultats visibles en 1 mois. Merci !'),
  ('bbbbbbbb-0004-0004-0004-000000000004', 'aaaaaaaa-0006-0006-0006-000000000006', NULL, 5, 'La meilleure nutritionniste ! Très disponible, répond rapidement et les conseils sont vraiment adaptés.'),

  -- Yassine Tazi
  ('bbbbbbbb-0005-0005-0005-000000000005', 'aaaaaaaa-0003-0003-0003-000000000003', 'cccccccc-0004-0004-0004-000000000004', 5, 'Yassine est passionné par son métier. Programme powerlifting bien pensé, progression constante. Top !'),
  ('bbbbbbbb-0005-0005-0005-000000000005', 'aaaaaaaa-0010-0010-0010-000000000010', NULL, 4, 'Très bon coach force. Technique irréprochable. Je l''ai recommandé à tous mes collègues de salle.'),

  -- Aicha Bensouda
  ('bbbbbbbb-0006-0006-0006-000000000006', 'aaaaaaaa-0008-0008-0008-000000000008', 'cccccccc-0005-0005-0005-000000000005', 5, 'Le cours de Zumba d''Aicha est absolument génial ! On danse, on transpire et on s''amuse. Une heure passe en 5 minutes !')
  ;

-- ============================================================
-- 7. USER STATS (10 entrées avec données variées)
-- ============================================================

UPDATE public.user_stats SET
  streak_days = 14, sessions_completed = 8,
  badges = ARRAY['Premier pas', 'Régularité', 'Défi HIIT'],
  last_session_at = '2026-05-01 09:00:00+01'
WHERE user_id = 'aaaaaaaa-0001-0001-0001-000000000001';

UPDATE public.user_stats SET
  streak_days = 7, sessions_completed = 5,
  badges = ARRAY['Premier pas', 'Yoga Explorer'],
  last_session_at = '2026-04-30 07:30:00+01'
WHERE user_id = 'aaaaaaaa-0002-0002-0002-000000000002';

UPDATE public.user_stats SET
  streak_days = 21, sessions_completed = 15,
  badges = ARRAY['Premier pas', 'Régularité', 'Force Brute', 'Powerlifter'],
  last_session_at = '2026-05-02 15:00:00+01'
WHERE user_id = 'aaaaaaaa-0003-0003-0003-000000000003';

UPDATE public.user_stats SET
  streak_days = 3, sessions_completed = 2,
  badges = ARRAY['Premier pas'],
  last_session_at = '2026-04-28 10:00:00+01'
WHERE user_id = 'aaaaaaaa-0004-0004-0004-000000000004';

UPDATE public.user_stats SET
  streak_days = 30, sessions_completed = 20,
  badges = ARRAY['Premier pas', 'Régularité', 'Champion', 'Boxeur', 'Iron Man'],
  last_session_at = '2026-05-03 09:00:00+01'
WHERE user_id = 'aaaaaaaa-0005-0005-0005-000000000005';

UPDATE public.user_stats SET
  streak_days = 5, sessions_completed = 3,
  badges = ARRAY['Premier pas', 'Nutrition Pro'],
  last_session_at = '2026-04-29 11:00:00+01'
WHERE user_id = 'aaaaaaaa-0006-0006-0006-000000000006';

UPDATE public.user_stats SET
  streak_days = 0, sessions_completed = 1,
  badges = ARRAY['Premier pas'],
  last_session_at = '2026-04-05 07:00:00+01'
WHERE user_id = 'aaaaaaaa-0007-0007-0007-000000000007';

UPDATE public.user_stats SET
  streak_days = 10, sessions_completed = 6,
  badges = ARRAY['Premier pas', 'Zumba Queen', 'Régularité'],
  last_session_at = '2026-05-01 17:00:00+01'
WHERE user_id = 'aaaaaaaa-0008-0008-0008-000000000008';

UPDATE public.user_stats SET
  streak_days = 8, sessions_completed = 4,
  badges = ARRAY['Premier pas', 'Nutrition Pro'],
  last_session_at = '2026-04-25 14:00:00+01'
WHERE user_id = 'aaaaaaaa-0009-0009-0009-000000000009';

UPDATE public.user_stats SET
  streak_days = 18, sessions_completed = 12,
  badges = ARRAY['Premier pas', 'Régularité', 'Force Brute'],
  last_session_at = '2026-05-02 16:00:00+01'
WHERE user_id = 'aaaaaaaa-0010-0010-0010-000000000010';

-- ============================================================
-- 8. PAIEMENTS (liés aux bookings confirmed + completed)
-- ============================================================

INSERT INTO public.payments (booking_id, user_id, amount, currency, status, payment_method, transaction_id, paid_at)
VALUES
  -- Séances terminées (completed)
  ('cccccccc-0001-0001-0001-000000000001', 'aaaaaaaa-0001-0001-0001-000000000001', 400.00, 'MAD', 'completed', 'Carte bancaire', 'TXN-CC-001', '2026-04-01 08:45:00+01'),
  ('cccccccc-0002-0002-0002-000000000002', 'aaaaaaaa-0004-0004-0004-000000000004', 520.00, 'MAD', 'completed', 'Virement',       'TXN-CC-002', '2026-04-04 18:00:00+01'),
  ('cccccccc-0003-0003-0003-000000000003', 'aaaaaaaa-0009-0009-0009-000000000009', 200.00, 'MAD', 'completed', 'Carte bancaire', 'TXN-CC-003', '2026-04-10 13:50:00+01'),
  ('cccccccc-0004-0004-0004-000000000004', 'aaaaaaaa-0003-0003-0003-000000000003', 450.00, 'MAD', 'completed', 'Cash',           'TXN-CC-004', '2026-04-12 14:30:00+01'),
  ('cccccccc-0005-0005-0005-000000000005', 'aaaaaaaa-0008-0008-0008-000000000008', 520.00, 'MAD', 'completed', 'Carte bancaire', 'TXN-CC-005', '2026-04-15 16:45:00+01'),
  ('cccccccc-0006-0006-0006-000000000006', 'aaaaaaaa-0005-0005-0005-000000000005', 350.00, 'MAD', 'completed', 'Virement',       'TXN-CC-006', '2026-04-17 20:00:00+01'),

  -- Séances confirmées (paiement completed à l'avance)
  ('cccccccc-0007-0007-0007-000000000007', 'aaaaaaaa-0002-0002-0002-000000000002', 600.00, 'MAD', 'completed', 'Carte bancaire', 'TXN-CC-007', '2026-05-05 10:00:00+01'),
  ('cccccccc-0008-0008-0008-000000000008', 'aaaaaaaa-0007-0007-0007-000000000007', 600.00, 'MAD', 'completed', 'Carte bancaire', 'TXN-CC-008', '2026-05-06 09:00:00+01'),
  ('cccccccc-0009-0009-0009-000000000009', 'aaaaaaaa-0006-0006-0006-000000000006', 200.00, 'MAD', 'pending',   'Carte bancaire',  NULL,        NULL),
  ('cccccccc-0010-0010-0010-000000000010', 'aaaaaaaa-0010-0010-0010-000000000010', 450.00, 'MAD', 'pending',   'Virement',        NULL,        NULL),

  -- Séances annulées (remboursées)
  ('cccccccc-0014-0014-0014-000000000014', 'aaaaaaaa-0001-0001-0001-000000000001', 350.00, 'MAD', 'refunded',  'Carte bancaire', 'TXN-CC-014', '2026-04-19 12:00:00+01');

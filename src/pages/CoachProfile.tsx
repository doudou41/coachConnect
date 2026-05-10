import { useParams, useNavigate } from "react-router-dom";
import { ArrowLeft, Star, MapPin, Wifi, BadgeCheck, Clock, Share2, Users } from "lucide-react";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { useCoach } from "@/hooks/useCoaches";

const CoachProfile = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const { data: coach, isLoading } = useCoach(id);
  const [selectedFormat, setSelectedFormat] = useState(0);

  if (isLoading) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-background">
        <p className="text-muted-foreground">Chargement...</p>
      </div>
    );
  }

  if (!coach) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-background">
        <p className="text-muted-foreground">Coach introuvable</p>
      </div>
    );
  }

  const selected = coach.pricing[selectedFormat];

  return (
    <div className="min-h-screen bg-background pb-32">
      {/* Hero */}
      <div className="relative">
        <img
          src={coach.image}
          alt={coach.name}
          className="h-72 w-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-background via-background/20 to-transparent" />
        <button
          onClick={() => navigate(-1)}
          className="absolute left-4 top-12 flex h-9 w-9 items-center justify-center rounded-full bg-card/80 backdrop-blur-sm"
        >
          <ArrowLeft className="h-5 w-5 text-foreground" />
        </button>
        <button className="absolute right-4 top-12 flex h-9 w-9 items-center justify-center rounded-full bg-card/80 backdrop-blur-sm">
          <Share2 className="h-4.5 w-4.5 text-foreground" />
        </button>
      </div>

      {/* Info */}
      <div className="-mt-12 relative px-5">
        <div className="flex items-center gap-1.5">
          <h1 className="text-[24px] font-bold text-foreground">{coach.name}</h1>
          {coach.certified && <BadgeCheck className="h-5 w-5 text-primary" />}
        </div>
        <p className="mt-1 text-[14px] text-muted-foreground">
          {coach.specialties.join(" · ")}
        </p>
        <div className="mt-3 flex items-center gap-4 text-[13px]">
          <span className="flex items-center gap-1 text-foreground">
            <Star className="h-4 w-4 fill-amber text-amber" />
            {coach.rating} <span className="text-muted-foreground">({coach.reviewCount} avis)</span>
          </span>
          <span className="flex items-center gap-1 text-muted-foreground">
            <MapPin className="h-4 w-4" />
            {coach.city}
          </span>
          {coach.online && (
            <span className="flex items-center gap-1 text-success">
              <Wifi className="h-4 w-4" />
              En ligne
            </span>
          )}
        </div>
        <div className="mt-2 flex items-center gap-1 text-[13px] text-muted-foreground">
          <Clock className="h-4 w-4" />
          {coach.experience} d'expérience
        </div>
      </div>

      {/* Bio */}
      <section className="mt-6 px-5">
        <h2 className="text-[13px] font-semibold uppercase tracking-wide text-muted-foreground">
          À propos
        </h2>
        <p className="mt-2 text-[14px] leading-relaxed text-foreground">{coach.bio}</p>
      </section>

      {/* Pricing - Core Feature */}
      <section className="mt-6 px-5">
        <div className="flex items-center gap-2">
          <h2 className="text-[13px] font-semibold uppercase tracking-wide text-muted-foreground">
            Tarification dégressive
          </h2>
          <Users className="h-4 w-4 text-primary" />
        </div>
        <p className="mt-1 text-[12px] text-muted-foreground">
          Plus vous êtes nombreux, moins vous payez
        </p>

        <div className="mt-3 flex flex-col gap-1.5">
          {coach.pricing.map((tier, i) => (
            <button
              key={tier.format}
              onClick={() => setSelectedFormat(i)}
              className={`flex items-center justify-between rounded-xl px-4 py-3 transition-all ${
                selectedFormat === i
                  ? "bg-primary/10 ring-1.5 ring-primary"
                  : "bg-card shadow-sm"
              }`}
            >
              <div className="flex items-center gap-3">
                <span
                  className={`flex h-8 w-8 items-center justify-center rounded-full text-[13px] font-bold ${
                    selectedFormat === i
                      ? "bg-primary text-primary-foreground"
                      : "bg-secondary text-muted-foreground"
                  }`}
                >
                  {tier.people}
                </span>
                <div className="text-left">
                  <p className="text-[14px] font-medium text-foreground">{tier.format}</p>
                  <p className="text-[12px] text-muted-foreground">
                    {tier.people} personne{tier.people > 1 ? "s" : ""}
                  </p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-[16px] font-bold text-foreground">{tier.pricePerPerson} MAD</p>
                {tier.savings !== "—" && (
                  <p className="text-[12px] font-medium text-success">{tier.savings}</p>
                )}
              </div>
            </button>
          ))}
        </div>
      </section>

      {/* Availability */}
      <section className="mt-6 px-5">
        <h2 className="text-[13px] font-semibold uppercase tracking-wide text-muted-foreground">
          Disponibilités
        </h2>
        <div className="mt-3 flex flex-wrap gap-2">
          {coach.availability.map((slot) => (
            <span
              key={slot}
              className="rounded-lg bg-card px-3 py-1.5 text-[12px] font-medium text-foreground shadow-sm"
            >
              {slot}
            </span>
          ))}
        </div>
      </section>

      {/* Sticky CTA */}
      <div className="fixed bottom-0 left-0 right-0 border-t border-border bg-card/90 backdrop-blur-xl safe-bottom">
        <div className="mx-auto flex max-w-lg items-center justify-between px-5 py-3">
          <div>
            <p className="text-[18px] font-bold text-foreground">{selected.pricePerPerson} MAD</p>
            <p className="text-[12px] text-muted-foreground">
              {selected.format} · {selected.people} pers.
            </p>
          </div>
          <Button className="rounded-xl bg-primary px-6 py-2.5 text-[14px] font-semibold text-primary-foreground shadow-none active:scale-[0.97]">
            Réserver
          </Button>
        </div>
      </div>
    </div>
  );
};

export default CoachProfile;

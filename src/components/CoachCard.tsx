import { Star, MapPin, Wifi, BadgeCheck } from "lucide-react";
import { useNavigate } from "react-router-dom";
import type { Coach } from "@/data/coaches";

interface CoachCardProps {
  coach: Coach;
}

const CoachCard = ({ coach }: CoachCardProps) => {
  const navigate = useNavigate();

  return (
    <button
      onClick={() => navigate(`/coach/${coach.id}`)}
      className="flex w-full items-center gap-3.5 rounded-2xl bg-card p-3.5 text-left shadow-sm transition-all active:scale-[0.98]"
    >
      <img
        src={coach.image}
        alt={coach.name}
        className="h-16 w-16 shrink-0 rounded-2xl object-cover"
      />
      <div className="min-w-0 flex-1">
        <div className="flex items-center gap-1.5">
          <h3 className="truncate text-[15px] font-semibold text-foreground">{coach.name}</h3>
          {coach.certified && <BadgeCheck className="h-4 w-4 shrink-0 text-primary" />}
        </div>
        <p className="mt-0.5 truncate text-[13px] text-muted-foreground">
          {coach.specialties.join(" · ")}
        </p>
        <div className="mt-1.5 flex items-center gap-3 text-[12px]">
          <span className="flex items-center gap-1 text-muted-foreground">
            <Star className="h-3.5 w-3.5 fill-amber text-amber" />
            {coach.rating}
          </span>
          <span className="flex items-center gap-1 text-muted-foreground">
            <MapPin className="h-3.5 w-3.5" />
            {coach.city}
          </span>
          {coach.online && (
            <span className="flex items-center gap-1 text-success">
              <Wifi className="h-3.5 w-3.5" />
              Online
            </span>
          )}
        </div>
      </div>
      <div className="shrink-0 text-right">
        <p className="text-[15px] font-bold text-foreground">{coach.priceSolo}</p>
        <p className="text-[11px] text-muted-foreground">MAD</p>
      </div>
    </button>
  );
};

export default CoachCard;

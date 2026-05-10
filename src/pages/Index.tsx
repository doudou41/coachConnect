import { ChevronRight } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { coaches } from "@/data/coaches";
import CoachCard from "@/components/CoachCard";

const Index = () => {
  const navigate = useNavigate();
  const topCoaches = coaches.slice(0, 3);

  return (
    <div className="min-h-screen bg-background pb-24">
      {/* Header */}
      <header className="px-5 pt-14 pb-2">
        <p className="text-[13px] text-muted-foreground">Bonjour 👋</p>
        <h1 className="mt-0.5 text-[26px] font-bold tracking-tight text-foreground">
          CoachConnect
        </h1>
      </header>

      {/* Quick Actions */}
      <section className="px-5 pt-4">
        <div className="grid grid-cols-2 gap-3">
          <button
            onClick={() => navigate("/explore")}
            className="rounded-2xl bg-primary px-4 py-5 text-left transition-all active:scale-[0.97]"
          >
            <p className="text-[15px] font-semibold text-primary-foreground">Trouver un coach</p>
            <p className="mt-1 text-[12px] text-primary-foreground/70">6 coachs certifiés</p>
          </button>
          <button
            onClick={() => navigate("/explore")}
            className="rounded-2xl bg-secondary px-4 py-5 text-left transition-all active:scale-[0.97]"
          >
            <p className="text-[15px] font-semibold text-foreground">Tarifs groupe</p>
            <p className="mt-1 text-[12px] text-muted-foreground">Jusqu'à -63%</p>
          </button>
        </div>
      </section>

      {/* How it works */}
      <section className="px-5 pt-8">
        <h2 className="text-[13px] font-semibold uppercase tracking-wide text-muted-foreground">
          Comment ça marche
        </h2>
        <div className="mt-3 flex gap-3 overflow-x-auto pb-1">
          {[
            { step: "1", title: "Choisissez", desc: "votre coach" },
            { step: "2", title: "Invitez", desc: "vos amis" },
            { step: "3", title: "Économisez", desc: "en groupe" },
          ].map((item) => (
            <div
              key={item.step}
              className="flex min-w-[120px] flex-col items-center rounded-2xl bg-card p-4 shadow-sm"
            >
              <span className="flex h-8 w-8 items-center justify-center rounded-full bg-primary/10 text-[14px] font-bold text-primary">
                {item.step}
              </span>
              <p className="mt-2 text-[13px] font-semibold text-foreground">{item.title}</p>
              <p className="text-[12px] text-muted-foreground">{item.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Top coaches */}
      <section className="px-5 pt-8">
        <div className="flex items-center justify-between">
          <h2 className="text-[13px] font-semibold uppercase tracking-wide text-muted-foreground">
            Coachs populaires
          </h2>
          <button
            onClick={() => navigate("/explore")}
            className="flex items-center gap-0.5 text-[13px] font-medium text-primary"
          >
            Voir tout <ChevronRight className="h-4 w-4" />
          </button>
        </div>
        <div className="mt-3 flex flex-col gap-2.5">
          {topCoaches.map((coach) => (
            <CoachCard key={coach.id} coach={coach} />
          ))}
        </div>
      </section>
    </div>
  );
};

export default Index;

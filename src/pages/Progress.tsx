import { Flame, Trophy, Calendar } from "lucide-react";

const Progress = () => {
  return (
    <div className="min-h-screen bg-background pb-24">
      <header className="px-5 pt-14 pb-2">
        <h1 className="text-[22px] font-bold text-foreground">Progrès</h1>
      </header>

      <div className="px-5 pt-4">
        {/* Stats */}
        <div className="grid grid-cols-3 gap-3">
          <div className="flex flex-col items-center rounded-2xl bg-card p-4 shadow-sm">
            <Flame className="h-6 w-6 text-primary" />
            <p className="mt-2 text-[20px] font-bold text-foreground">0</p>
            <p className="text-[11px] text-muted-foreground">Streak</p>
          </div>
          <div className="flex flex-col items-center rounded-2xl bg-card p-4 shadow-sm">
            <Calendar className="h-6 w-6 text-info" />
            <p className="mt-2 text-[20px] font-bold text-foreground">0</p>
            <p className="text-[11px] text-muted-foreground">Séances</p>
          </div>
          <div className="flex flex-col items-center rounded-2xl bg-card p-4 shadow-sm">
            <Trophy className="h-6 w-6 text-amber" />
            <p className="mt-2 text-[20px] font-bold text-foreground">0</p>
            <p className="text-[11px] text-muted-foreground">Badges</p>
          </div>
        </div>

        {/* Empty state */}
        <div className="mt-12 flex flex-col items-center text-center">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-secondary">
            <Calendar className="h-7 w-7 text-muted-foreground" />
          </div>
          <h2 className="mt-4 text-[16px] font-semibold text-foreground">
            Pas encore de séances
          </h2>
          <p className="mt-1 max-w-[260px] text-[13px] text-muted-foreground">
            Réservez votre première séance pour commencer à suivre vos progrès
          </p>
        </div>
      </div>
    </div>
  );
};

export default Progress;

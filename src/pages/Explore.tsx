import { useState } from "react";
import { Search } from "lucide-react";
import { specialties, cities } from "@/data/coaches";
import CoachCard from "@/components/CoachCard";
import { useCoaches } from "@/hooks/useCoaches";

const Explore = () => {
  const [search, setSearch] = useState("");
  const [selectedSpecialty, setSelectedSpecialty] = useState("Tous");
  const [selectedCity, setSelectedCity] = useState("Toutes");

  const { data: coaches = [], isLoading } = useCoaches();

  const filtered = coaches.filter((c) => {
    const matchSearch =
      !search ||
      c.name.toLowerCase().includes(search.toLowerCase()) ||
      c.specialties.some((s) => s.toLowerCase().includes(search.toLowerCase()));
    const matchSpecialty =
      selectedSpecialty === "Tous" || c.specialties.includes(selectedSpecialty);
    const matchCity =
      selectedCity === "Toutes" || c.city === selectedCity || (selectedCity === "En ligne" && c.online);
    return matchSearch && matchSpecialty && matchCity;
  });

  return (
    <div className="min-h-screen bg-background pb-24">
      <header className="px-5 pt-14 pb-2">
        <h1 className="text-[22px] font-bold text-foreground">Explorer</h1>
      </header>

      {/* Search */}
      <div className="px-5 pt-2">
        <div className="flex items-center gap-2.5 rounded-xl bg-card px-3.5 py-2.5 shadow-sm">
          <Search className="h-4.5 w-4.5 text-muted-foreground" />
          <input
            type="text"
            placeholder="Rechercher un coach ou une spécialité..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="flex-1 bg-transparent text-[14px] text-foreground placeholder:text-muted-foreground outline-none"
          />
        </div>
      </div>

      {/* Specialty filter */}
      <div className="mt-4 flex gap-2 overflow-x-auto px-5 pb-1">
        {specialties.map((s) => (
          <button
            key={s}
            onClick={() => setSelectedSpecialty(s)}
            className={`shrink-0 rounded-full px-3.5 py-1.5 text-[12px] font-medium transition-colors ${
              selectedSpecialty === s
                ? "bg-primary text-primary-foreground"
                : "bg-secondary text-muted-foreground"
            }`}
          >
            {s}
          </button>
        ))}
      </div>

      {/* City filter */}
      <div className="mt-2 flex gap-2 overflow-x-auto px-5 pb-1">
        {cities.map((c) => (
          <button
            key={c}
            onClick={() => setSelectedCity(c)}
            className={`shrink-0 rounded-full px-3.5 py-1.5 text-[12px] font-medium transition-colors ${
              selectedCity === c
                ? "bg-foreground text-background"
                : "bg-secondary text-muted-foreground"
            }`}
          >
            {c}
          </button>
        ))}
      </div>

      {/* Results */}
      <div className="mt-4 flex flex-col gap-2.5 px-5">
        {isLoading ? (
          <p className="py-12 text-center text-[14px] text-muted-foreground">Chargement...</p>
        ) : (
          <>
            <p className="text-[12px] text-muted-foreground">{filtered.length} coach{filtered.length > 1 ? "s" : ""}</p>
            {filtered.map((coach) => (
              <CoachCard key={coach.id} coach={coach} />
            ))}
            {filtered.length === 0 && (
              <p className="py-12 text-center text-[14px] text-muted-foreground">
                Aucun coach trouvé
              </p>
            )}
          </>
        )}
      </div>
    </div>
  );
};

export default Explore;

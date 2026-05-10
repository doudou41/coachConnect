import { User, Settings, CreditCard, HelpCircle, LogOut, ChevronRight } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { Button } from "@/components/ui/button";

const menuItems = [
  { icon: User, label: "Informations personnelles" },
  { icon: CreditCard, label: "Paiements" },
  { icon: Settings, label: "Paramètres" },
  { icon: HelpCircle, label: "Aide & Support" },
];

const Profile = () => {
  const { user, signOut } = useAuth();
  const navigate = useNavigate();

  if (!user) {
    return (
      <div className="min-h-screen bg-background pb-24">
        <header className="px-5 pt-14 pb-2">
          <h1 className="text-[22px] font-bold text-foreground">Profil</h1>
        </header>
        <div className="flex flex-col items-center px-5 pt-12">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
            <User className="h-7 w-7 text-primary" />
          </div>
          <p className="mt-4 text-[16px] font-semibold text-foreground">Bienvenue</p>
          <p className="mt-1 text-[13px] text-muted-foreground text-center">
            Connectez-vous pour accéder à votre profil et vos réservations
          </p>
          <Button
            className="mt-6 h-12 w-full rounded-xl text-[15px] font-semibold"
            onClick={() => navigate("/auth")}
          >
            Se connecter
          </Button>
        </div>
      </div>
    );
  }

  const displayName = user.user_metadata?.full_name || user.user_metadata?.name || user.email?.split("@")[0] || "Utilisateur";

  return (
    <div className="min-h-screen bg-background pb-24">
      <header className="px-5 pt-14 pb-2">
        <h1 className="text-[22px] font-bold text-foreground">Profil</h1>
      </header>

      <div className="px-5 pt-4">
        {/* Avatar */}
        <div className="flex items-center gap-3.5 rounded-2xl bg-card p-4 shadow-sm">
          <div className="flex h-14 w-14 items-center justify-center rounded-full bg-primary/10">
            <User className="h-6 w-6 text-primary" />
          </div>
          <div>
            <p className="text-[16px] font-semibold text-foreground">{displayName}</p>
            <p className="text-[13px] text-muted-foreground">{user.email}</p>
          </div>
        </div>

        {/* Menu */}
        <div className="mt-6 flex flex-col gap-1">
          {menuItems.map(({ icon: Icon, label }) => (
            <button
              key={label}
              className="flex items-center justify-between rounded-xl px-4 py-3.5 transition-colors active:bg-secondary"
            >
              <div className="flex items-center gap-3">
                <Icon className="h-5 w-5 text-muted-foreground" />
                <span className="text-[14px] text-foreground">{label}</span>
              </div>
              <ChevronRight className="h-4 w-4 text-muted-foreground" />
            </button>
          ))}
        </div>

        {/* Logout */}
        <button
          onClick={async () => {
            await signOut();
            navigate("/");
          }}
          className="mt-6 flex w-full items-center justify-center gap-2 rounded-xl py-3 text-[14px] font-medium text-destructive transition-colors active:bg-destructive/10"
        >
          <LogOut className="h-4 w-4" />
          Se déconnecter
        </button>
      </div>
    </div>
  );
};

export default Profile;

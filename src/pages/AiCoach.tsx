import { Bot, Send } from "lucide-react";
import { useState } from "react";

const AiCoach = () => {
  const [message, setMessage] = useState("");

  return (
    <div className="flex min-h-screen flex-col bg-background pb-24">
      <header className="px-5 pt-14 pb-2">
        <h1 className="text-[22px] font-bold text-foreground">Coach IA</h1>
        <p className="mt-0.5 text-[13px] text-muted-foreground">
          Votre assistant fitness personnel
        </p>
      </header>

      <div className="flex flex-1 flex-col items-center justify-center px-5">
        <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
          <Bot className="h-8 w-8 text-primary" />
        </div>
        <h2 className="mt-4 text-[16px] font-semibold text-foreground">
          Posez votre question
        </h2>
        <p className="mt-1 max-w-[280px] text-center text-[13px] text-muted-foreground">
          Nutrition, programme d'entraînement, choix de coach — je suis là pour vous aider
        </p>
      </div>

      <div className="px-5 pb-4">
        <div className="flex items-center gap-2 rounded-xl bg-card px-3.5 py-2.5 shadow-sm">
          <input
            type="text"
            placeholder="Votre message..."
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            className="flex-1 bg-transparent text-[14px] text-foreground placeholder:text-muted-foreground outline-none"
          />
          <button className="flex h-8 w-8 items-center justify-center rounded-full bg-primary text-primary-foreground">
            <Send className="h-4 w-4" />
          </button>
        </div>
      </div>
    </div>
  );
};

export default AiCoach;

export interface Coach {
  id: string;
  name: string;
  specialties: string[];
  city: string;
  priceSolo: number;
  rating: number;
  reviewCount: number;
  image: string;
  bio: string;
  certified: boolean;
  online: boolean;
  experience: string;
  pricing: { format: string; people: number; pricePerPerson: number; coachRevenue: number; savings: string }[];
  availability: string[];
}

export const coaches: Coach[] = [
  {
    id: "karim-alaoui",
    name: "Karim Alaoui",
    specialties: ["Musculation", "HIIT", "CrossFit"],
    city: "Casablanca",
    priceSolo: 400,
    rating: 4.9,
    reviewCount: 127,
    image: "https://images.unsplash.com/photo-1567013127542-490d483bf823?w=400&h=400&fit=crop&crop=face",
    bio: "Coach certifié CF-L2 avec 8 ans d'expérience. Spécialisé dans la transformation physique et la préparation athlétique. Ancien athlète national de CrossFit.",
    certified: true,
    online: false,
    experience: "8 ans",
    pricing: [
      { format: "Solo", people: 1, pricePerPerson: 400, coachRevenue: 400, savings: "—" },
      { format: "Duo", people: 2, pricePerPerson: 300, coachRevenue: 600, savings: "-25%" },
      { format: "Trio", people: 3, pricePerPerson: 220, coachRevenue: 660, savings: "-45%" },
      { format: "Groupe", people: 4, pricePerPerson: 180, coachRevenue: 720, savings: "-55%" },
      { format: "Max", people: 5, pricePerPerson: 150, coachRevenue: 750, savings: "-63%" },
    ],
    availability: ["Lun 8h-12h", "Mar 14h-19h", "Mer 8h-18h", "Ven 9h-15h", "Sam 8h-13h"],
  },
  {
    id: "salma-idrissi",
    name: "Salma Idrissi",
    specialties: ["Yoga", "Pilates", "Méditation"],
    city: "Casablanca",
    priceSolo: 350,
    rating: 4.8,
    reviewCount: 203,
    image: "https://images.unsplash.com/photo-1594381898411-846e7d193883?w=400&h=400&fit=crop&crop=face",
    bio: "Instructrice RYT-500, formée en Inde. Je propose des séances de yoga adaptées à tous les niveaux, du débutant à l'avancé. Spécialiste en yoga thérapeutique.",
    certified: true,
    online: true,
    experience: "6 ans",
    pricing: [
      { format: "Solo", people: 1, pricePerPerson: 350, coachRevenue: 350, savings: "—" },
      { format: "Duo", people: 2, pricePerPerson: 260, coachRevenue: 520, savings: "-26%" },
      { format: "Trio", people: 3, pricePerPerson: 200, coachRevenue: 600, savings: "-43%" },
      { format: "Groupe", people: 4, pricePerPerson: 160, coachRevenue: 640, savings: "-54%" },
      { format: "Max", people: 5, pricePerPerson: 130, coachRevenue: 650, savings: "-63%" },
    ],
    availability: ["Lun 7h-11h", "Mar 7h-11h", "Jeu 16h-20h", "Sam 9h-14h", "Dim 8h-12h"],
  },
  {
    id: "omar-fassi",
    name: "Omar Fassi",
    specialties: ["Boxe", "Cross Training"],
    city: "Casablanca",
    priceSolo: 350,
    rating: 4.7,
    reviewCount: 89,
    image: "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=400&h=400&fit=crop&crop=face",
    bio: "Ancien boxeur professionnel, brevet d'État Boxe française. Entraîneur passionné par le dépassement de soi. Ambiance intense garantie.",
    certified: true,
    online: false,
    experience: "10 ans",
    pricing: [
      { format: "Solo", people: 1, pricePerPerson: 350, coachRevenue: 350, savings: "—" },
      { format: "Duo", people: 2, pricePerPerson: 260, coachRevenue: 520, savings: "-26%" },
      { format: "Trio", people: 3, pricePerPerson: 195, coachRevenue: 585, savings: "-44%" },
      { format: "Groupe", people: 4, pricePerPerson: 155, coachRevenue: 620, savings: "-56%" },
      { format: "Max", people: 5, pricePerPerson: 130, coachRevenue: 650, savings: "-63%" },
    ],
    availability: ["Mar 9h-13h", "Mer 15h-20h", "Jeu 9h-13h", "Ven 15h-20h", "Sam 10h-15h"],
  },
  {
    id: "nadia-berrada",
    name: "Nadia Berrada",
    specialties: ["Nutrition", "Diététique"],
    city: "En ligne",
    priceSolo: 200,
    rating: 5.0,
    reviewCount: 312,
    image: "https://images.unsplash.com/photo-1607746882042-944635dfe10e?w=400&h=400&fit=crop&crop=face",
    bio: "Nutritionniste diplômée DIETECOM, spécialisée en nutrition sportive. Consultations 100% en ligne. Plans alimentaires personnalisés et suivi hebdomadaire.",
    certified: true,
    online: true,
    experience: "5 ans",
    pricing: [
      { format: "Solo", people: 1, pricePerPerson: 200, coachRevenue: 200, savings: "—" },
      { format: "Duo", people: 2, pricePerPerson: 150, coachRevenue: 300, savings: "-25%" },
      { format: "Trio", people: 3, pricePerPerson: 120, coachRevenue: 360, savings: "-40%" },
      { format: "Groupe", people: 4, pricePerPerson: 100, coachRevenue: 400, savings: "-50%" },
      { format: "Max", people: 5, pricePerPerson: 85, coachRevenue: 425, savings: "-58%" },
    ],
    availability: ["Lun-Ven 9h-18h", "Sam 10h-14h"],
  },
  {
    id: "yassine-tazi",
    name: "Yassine Tazi",
    specialties: ["Powerlifting", "Musculation"],
    city: "Rabat",
    priceSolo: 450,
    rating: 4.6,
    reviewCount: 64,
    image: "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400&h=400&fit=crop&crop=face",
    bio: "Coach ISSA certifié, passionné de powerlifting. Je vous accompagne vers vos objectifs de force avec des programmes structurés et un suivi rigoureux.",
    certified: true,
    online: true,
    experience: "7 ans",
    pricing: [
      { format: "Solo", people: 1, pricePerPerson: 450, coachRevenue: 450, savings: "—" },
      { format: "Duo", people: 2, pricePerPerson: 340, coachRevenue: 680, savings: "-24%" },
      { format: "Trio", people: 3, pricePerPerson: 250, coachRevenue: 750, savings: "-44%" },
      { format: "Groupe", people: 4, pricePerPerson: 200, coachRevenue: 800, savings: "-56%" },
      { format: "Max", people: 5, pricePerPerson: 170, coachRevenue: 850, savings: "-62%" },
    ],
    availability: ["Lun 14h-20h", "Mer 8h-14h", "Jeu 14h-20h", "Sam 9h-16h"],
  },
  {
    id: "aicha-bensouda",
    name: "Aicha Bensouda",
    specialties: ["Zumba", "Danse Fitness"],
    city: "Marrakech",
    priceSolo: 280,
    rating: 4.9,
    reviewCount: 178,
    image: "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&h=400&fit=crop&crop=face",
    bio: "Instructrice Zumba licenciée, danseuse professionnelle. Mes cours allient fun et fitness dans une ambiance festive. Disponible en présentiel et en ligne.",
    certified: true,
    online: true,
    experience: "4 ans",
    pricing: [
      { format: "Solo", people: 1, pricePerPerson: 280, coachRevenue: 280, savings: "—" },
      { format: "Duo", people: 2, pricePerPerson: 210, coachRevenue: 420, savings: "-25%" },
      { format: "Trio", people: 3, pricePerPerson: 160, coachRevenue: 480, savings: "-43%" },
      { format: "Groupe", people: 4, pricePerPerson: 130, coachRevenue: 520, savings: "-54%" },
      { format: "Max", people: 5, pricePerPerson: 110, coachRevenue: 550, savings: "-61%" },
    ],
    availability: ["Lun 17h-21h", "Mar 10h-14h", "Jeu 17h-21h", "Sam 10h-16h", "Dim 10h-14h"],
  },
];

export const specialties = ["Tous", "Musculation", "HIIT", "CrossFit", "Yoga", "Pilates", "Boxe", "Nutrition", "Powerlifting", "Zumba", "Danse Fitness"];
export const cities = ["Toutes", "Casablanca", "Rabat", "Marrakech", "En ligne"];

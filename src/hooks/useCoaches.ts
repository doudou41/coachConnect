import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import type { Coach } from "@/data/coaches";

function mapToCoach(row: Record<string, unknown>): Coach {
  const pricing = Array.isArray(row.pricing) ? row.pricing : [];
  const availability = Array.isArray(row.availability) ? row.availability : [];
  return {
    id: row.id as string,
    name: row.name as string,
    specialties: (row.specialties as string[]) ?? [],
    city: row.city as string,
    priceSolo: row.price_solo as number,
    rating: row.rating as number,
    reviewCount: row.review_count as number,
    image: row.image_url as string,
    bio: row.bio as string,
    certified: row.certified as boolean,
    online: row.online as boolean,
    experience: `${row.experience_years} ans`,
    pricing,
    availability,
  };
}

export function useCoaches() {
  return useQuery({
    queryKey: ["coaches"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("coaches")
        .select("*")
        .order("rating", { ascending: false });
      if (error) throw error;
      return (data ?? []).map(mapToCoach);
    },
  });
}

export function useCoach(id: string | undefined) {
  return useQuery({
    queryKey: ["coach", id],
    enabled: !!id,
    queryFn: async () => {
      const { data, error } = await supabase
        .from("coaches")
        .select("*")
        .eq("id", id!)
        .single();
      if (error) throw error;
      return mapToCoach(data as Record<string, unknown>);
    },
  });
}

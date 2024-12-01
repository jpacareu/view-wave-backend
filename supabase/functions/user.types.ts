import { Tables } from "./types.ts";

export type UserEntities = {
  organization: Pick<Tables<"organizations">, "id" | "name" | "category">;
  branches: Pick<Tables<"branches">, "id" | "name" | "category">[];
};

export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      ads: {
        Row: {
          branch_id: string | null
          created_at: string
          id: string
          media_id: string | null
          name: string | null
          provider: string | null
        }
        Insert: {
          branch_id?: string | null
          created_at?: string
          id?: string
          media_id?: string | null
          name?: string | null
          provider?: string | null
        }
        Update: {
          branch_id?: string | null
          created_at?: string
          id?: string
          media_id?: string | null
          name?: string | null
          provider?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "ads_branch_id_fkey"
            columns: ["branch_id"]
            isOneToOne: false
            referencedRelation: "branches"
            referencedColumns: ["id"]
          },
        ]
      }
      branches: {
        Row: {
          created_at: string
          id: string
          name: string | null
          organization_id: string | null
          places_id: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          name?: string | null
          organization_id?: string | null
          places_id?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          name?: string | null
          organization_id?: string | null
          places_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "branches_organization_id_fkey"
            columns: ["organization_id"]
            isOneToOne: false
            referencedRelation: "organizations"
            referencedColumns: ["id"]
          },
        ]
      }
      contents: {
        Row: {
          created_at: string
          id: string
          media_id: string | null
          provider: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          media_id?: string | null
          provider?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          media_id?: string | null
          provider?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "contents_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      devices: {
        Row: {
          android_id: string | null
          branch_id: string | null
          code_exp: string | null
          code_value: string | null
          created_at: string
          id: string
          list_id: string | null
          name: string | null
          organization_id: string | null
          status: Database["public"]["Enums"]["device_status"] | null
        }
        Insert: {
          android_id?: string | null
          branch_id?: string | null
          code_exp?: string | null
          code_value?: string | null
          created_at?: string
          id?: string
          list_id?: string | null
          name?: string | null
          organization_id?: string | null
          status?: Database["public"]["Enums"]["device_status"] | null
        }
        Update: {
          android_id?: string | null
          branch_id?: string | null
          code_exp?: string | null
          code_value?: string | null
          created_at?: string
          id?: string
          list_id?: string | null
          name?: string | null
          organization_id?: string | null
          status?: Database["public"]["Enums"]["device_status"] | null
        }
        Relationships: [
          {
            foreignKeyName: "devices_branch_id_fkey"
            columns: ["branch_id"]
            isOneToOne: false
            referencedRelation: "branches"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "devices_list_id_fkey"
            columns: ["list_id"]
            isOneToOne: false
            referencedRelation: "lists"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "devices_organization_id_fkey"
            columns: ["organization_id"]
            isOneToOne: false
            referencedRelation: "organizations"
            referencedColumns: ["id"]
          },
        ]
      }
      lists: {
        Row: {
          content: string[] | null
          created_at: string
          id: string
          name: string | null
        }
        Insert: {
          content?: string[] | null
          created_at?: string
          id?: string
          name?: string | null
        }
        Update: {
          content?: string[] | null
          created_at?: string
          id?: string
          name?: string | null
        }
        Relationships: []
      }
      organizations: {
        Row: {
          category: string | null
          created_at: string
          id: string
          name: string | null
        }
        Insert: {
          category?: string | null
          created_at?: string
          id?: string
          name?: string | null
        }
        Update: {
          category?: string | null
          created_at?: string
          id?: string
          name?: string | null
        }
        Relationships: []
      }
      users: {
        Row: {
          created_at: string
          email: string | null
          id: string
          name: string | null
          organization_id: string | null
        }
        Insert: {
          created_at?: string
          email?: string | null
          id?: string
          name?: string | null
          organization_id?: string | null
        }
        Update: {
          created_at?: string
          email?: string | null
          id?: string
          name?: string | null
          organization_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "users_organization_id_fkey"
            columns: ["organization_id"]
            isOneToOne: false
            referencedRelation: "organizations"
            referencedColumns: ["id"]
          },
        ]
      }
      users_branches: {
        Row: {
          branch_id: string
          user_id: string
        }
        Insert: {
          branch_id: string
          user_id: string
        }
        Update: {
          branch_id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "users_branches_branch_id_fkey"
            columns: ["branch_id"]
            isOneToOne: false
            referencedRelation: "branches"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "users_branches_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      generate_and_update_code: {
        Args: {
          android_id: string
        }
        Returns: string
      }
      get_branch_devices: {
        Args: {
          branch_id: string
        }
        Returns: {
          id: string
          name: string
          list_id: string
        }[]
      }
    }
    Enums: {
      device_status: "initialized" | "assigned" | "booted"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof PublicSchema["CompositeTypes"]
    | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof Database }
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof PublicSchema["CompositeTypes"]
    ? PublicSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

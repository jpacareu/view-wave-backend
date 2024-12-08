set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_user_entities()
 RETURNS jsonb
 LANGUAGE plpgsql
AS $function$BEGIN
    RETURN (
     WITH active_branches AS (
            SELECT b.id AS branch_id, b.organization_id, b.name, b.category, ub.is_active, o.name AS org_name, o.category AS org_category
            FROM branches b
            INNER JOIN users_branches ub ON b.id = ub.branch_id
            INNER JOIN organizations o ON b.organization_id = o.id
            WHERE ub.user_id = auth.uid()
        )
        SELECT jsonb_build_object(
            'organization', jsonb_build_object(
                'id', organization_id,
                'name', org_name,
                'category', org_category
            ),
            'branches', jsonb_agg(
                jsonb_build_object(
                    'id', branch_id,
                    'name', name,
                    'category', category,
                    'is_active', false
                )
            ),
            'active_branch', COALESCE(
                (SELECT branch_id FROM active_branches WHERE is_active = true LIMIT 1),
                (SELECT branch_id FROM active_branches LIMIT 1)
            )
        )
        FROM active_branches
        GROUP BY organization_id, org_name, org_category
    );
END;$function$
;



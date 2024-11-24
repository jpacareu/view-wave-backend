set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_branch_devices(branch_id uuid)
 RETURNS TABLE(id uuid, name text, list_id uuid)
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN QUERY
    SELECT d.id, d.name, d.list_id
    FROM devices d
    JOIN branches b ON b.id = d.branch_id
    JOIN users u ON u.organization_id = b.organization_id
    WHERE b.id = branch_id
      AND b.organization_id = d.organization_id
      AND b.organization_id = u.organization_id
      AND u.id = auth.uid();
END;
$function$
;



-- 1) Rechercher le user avec username = "Default owner"
-- 2) Si il existe alors on retourne le user 
-- 3) Sinon 
--	  3.1) On crée le user avec le username = "Default owner"
--	  3.2) On retourne le user crée
 

CREATE OR REPLACE FUNCTION get_default_owner()RETURNS "user" AS $$
DECLARE
		defaultOwner "user"%rowtype;
		defaultOwnerUsername varchar(50) := 'DefaultOwner';
BEGIN 
	SELECT *
	FROM "user" 
	WHERE username = defaultOwnerUsername;

	if not found then 
		INSERT INTO "user" (id, username)
		VALUES (nextval('id_generator'), defaultOwnerUsername);
		SELECT * INTO defaultOwner
		FROM "user"
		WHERE username = defaultOwnerUsername;
	end if;
	
RETURN defaultOwner;
END

$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fix_activities_without_owner()RETURNS SETOF activity AS $$
	DECLARE
	BEGIN
		
	END 

$$ LANGUAGE plpgsql;



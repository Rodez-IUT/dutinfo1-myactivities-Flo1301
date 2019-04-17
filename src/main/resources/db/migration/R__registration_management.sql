-- la premiere fonction
CREATE OR REPLACE FUNCTION register_user_on_activity(user_id bigint, activity_id bigint) RETURNS registration AS $$
 DECLARE
    contenuRqt registration%rowtype;
BEGIN 
	SELECT * INTO contenuRqt
	FROM registration 
	WHERE user_id = in_user_id
	AND activity_id = in_activity_id;
	

	IF FOUND THEN		   
		RAISE EXCEPTION 'registration_already_exists';	 
	END IF;    
	-- insertion 
    INSERT INTO registration(id,user_id,activity_id) VALUES (nextval('id_generator'),in_user_id,in_activity_id);
    -- retourne le resultat 
    select * INTO contenuRqt FROM registration
    WHERE user_id = in_user_id 
    AND activity_id = in_activity_id;
    
    RETURN contenuRqt;

END;
$$ LANGUAGE plpgsql ;

-- la deuxieme fonction

CREATE OR REPLACE FUNCTION unregister_user_on_activity(user_iDinscription bigint, activity_iDinscription bigint) RETURNS void AS $$
DECLARE
    contenuRqt registration%rowtype;
BEGIN 
	SELECT * INTO contenuRqt
	FROM registration 
	WHERE user_id = in_user_id
	AND activity_id = in_activity_id;
	

	IF NOT FOUND THEN		   
		RAISE EXCEPTION 'registration_not_found';	 
	END IF;    
	-- suppresion 
    DELETE FROM registration
    WHERE user_id = in_user_id 
    AND activity_id = in_activity_id;
      --pas de return car VOID
 END;
    
$$ LANGUAGE plpgsql ;

--la fonction trigger 

CREATE OR REPLACE FUNCTION log_insert_registration() RETURNS TRIGGER AS $$
BEGIN 
	INSERT INTO action_log () VALUES();
	RETURN NULL;
END

$$ LANGUAGE plpgsql ;
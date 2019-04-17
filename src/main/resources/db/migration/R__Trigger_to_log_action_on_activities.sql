
CREATE OR REPLACE FUNCTION log_action_on_activities() RETURNS trigger AS $$
			
BEGIN
		
	    SELECT COUNT (*)AS COUNT FROM find_all_activities_for_owner('John Doe');
	    SELECT * FROM action_log;
END;
$$ LANGUAGE plpgsql;



CREATE trigger  log_action_on_activities BEFORE INSERT OR UPDATE OR DELETE ON activity
FOR EACH  ROW  EXECUTE PROCEDURE log_action_on_activities(); 

	SELECT COUNT(*) AS COUNT FROM action_log;
	DELETE FROM activity WHERE owner_id = 1;


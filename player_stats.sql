--WITH selected_data AS (
--    SELECT ks.*, g.cleansheets
--    FROM key_stats ks
--    LEFT JOIN goalkeeping g
--    ON ks.player_name = g.player_name
--)
--SELECT COUNT(*) FROM selected_data;

--SELECT column_name
--FROM information_schema.columns
--WHERE table_name = 'key_stats' AND column_name = 'unique_id';

--ALTER TABLE key_stats ADD COLUMN unique_id VARCHAR(255);
----ALTER TABLE attacking ADD COLUMN unique_id VARCHAR(255);
----ALTER TABLE defending ADD COLUMN unique_id VARCHAR(255);
--ALTER TABLE attempts ADD COLUMN unique_id VARCHAR(255);
--ALTER TABLE disciplinary ADD COLUMN unique_id VARCHAR(255);
--ALTER TABLE distributon ADD COLUMN unique_id VARCHAR(255);
----ALTER TABLE goals ADD COLUMN unique_id VARCHAR(255);
--ALTER TABLE goalkeeping ADD COLUMN unique_id VARCHAR(255);
--
--UPDATE key_stats 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE attacking 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE defending 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE attempts 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE disciplinary 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE distributon 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE goals 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';
--UPDATE goalkeeping 
--SET unique_id = CONCAT(player_name, '_', position, '_', club)
--WHERE unique_id IS NULL OR unique_id = '';

--drop view correct_final_data ;
CREATE VIEW correct_final_data AS
WITH correct_final_data AS (
    SELECT ks.*, 
        att.corner_taken ,
        att.offsides  , 
        att.dribbles , 
        d.tackles , 
        d.t_won , 
        d.t_lost , 
        d.balls_recoverd , 
        d.clearance_attempted,
        a.total_attempts ,
        a.on_target ,
        a.off_target ,
        a."blocked" ,
        d2.red ,
        d2.yellow ,
        d2.fouls_committed ,
        d2.fouls_suffered ,
        d3.cross_accuracy ,
        d3.cross_attempted ,
        d3.cross_complted ,
        d3.freekicks_taken ,
        d3.pass_accuracy ,
        d3.pass_attempted ,
        d3.pass_completed ,
        g.right_foot ,
        g.left_foot ,
        g.headers ,
        g.penalties ,
        g."others" ,
        g.inside_area ,
        g.outside_areas ,
        g2.saved ,
        g2.saved_penalties ,
        g2.conceded ,
        g2.cleansheets ,
        g2."punches made" 
    FROM key_stats ks
    LEFT JOIN attacking att ON ks.unique_id = att.unique_id
    LEFT JOIN defending d ON ks.unique_id = d.unique_id 
    LEFT JOIN attempts a ON ks.unique_id = a.unique_id 
    LEFT JOIN disciplinary d2 ON ks.unique_id = d2.unique_id 
    LEFT JOIN distributon d3 ON ks.unique_id = d3.unique_id 
    LEFT JOIN goals g ON ks.unique_id = g.unique_id 
    LEFT JOIN goalkeeping g2 ON ks.unique_id = g2.unique_id 
)
SELECT * FROM correct_final_data;

SELECT unique_id, COUNT(*) AS duplicates
FROM correct_final_data
GROUP BY unique_id
HAVING COUNT(*) > 1
ORDER BY unique_id;

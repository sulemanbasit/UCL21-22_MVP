-- Script to pull out club's attacking performance

--create materialized view club_attacking_performance AS
--SELECT 
--    CASE 
--        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
--        ELSE club
--    END AS club,
--    SUM(assists) AS total_assists, 
--    SUM(corner_taken) AS total_corners, 
--    SUM(offsides) AS total_offsides, 
--    SUM(dribbles) AS total_dribbles, 
--    CASE 
--        WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".attacking
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--FROM "UCL".attacking
--GROUP BY GROUPING SETS ((club), ());
--
--REFRESH MATERIALIZED VIEW club_attacking_performance;


-- Script to get club's defending performance

--create materialized view club_defending_performance as
--SELECT 
--    CASE 
--        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
--        ELSE club
--    END AS club,
--    sum(balls_recoverd) as total_balls_recovered,
--    sum(tackles) as total_tackles,
--    sum(t_won) as total_tackles_won,
--    sum(t_lost) as total_tackles_lost,
--    sum(clearance_attempted) as total_clearance_attempted,
--    CASE 
--        WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".defending
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--FROM "UCL".defending
--GROUP BY GROUPING SETS ((club), ());
--
--refresh materialized view club_defending_performance;

-- Script to get club's disciplinary penalties

--create materialized view club_disciplinary_penalties as
--SELECT 
--    CASE 
--        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
--        ELSE club
--    END AS club,
--    sum(fouls_committed) as total_fouls_committed,
--    sum(fouls_suffered) as total_fouls_suffered,
--    sum(red) as total_red,
--    sum(yellow) as total_yellow,
--    case 
--    	when grouping(club) = 1 then (
--	    	select sum(max_minutes)
--    		from (
--    			select club, Max(minutes_played) as max_minutes
--    			from "UCL".disciplinary
--	    		group by club
--    		) max_minutes_per_club
--    	) else max(minutes_played)
--    end as total_minutes_played,
--    CASE 
--        WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".disciplinary
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--FROM "UCL".disciplinary
--GROUP BY GROUPING SETS ((club), ())
--
--refresh materialized view club_disciplinary_penalties;

-- Script to get club's distribution stats

--create materialized view club_distribution_performance as
--SELECT 
--    CASE 
--        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
--        ELSE club
--    END AS club,
--     -- Calculate pass accuracy based on completed/attempted passes
--    ROUND((SUM(pass_completed) * 100.0) / NULLIF(SUM(pass_attempted), 0), 2) AS avg_pass_accuracy,
--    SUM(pass_attempted) AS total_pass_attempted,
--    SUM(pass_completed) AS total_pass_completed,
--    -- Calculate cross accuracy the same way
--    ROUND((SUM(cross_complted) * 100.0) / NULLIF(SUM(cross_attempted), 0), 2) AS avg_cross_accuracy,
--    sum(cross_attempted) as total_cross_attempted,
--    sum(cross_complted) as total_cross_completed,
--    sum(freekicks_taken) as total_freekicks_taken,
--    CASE 
--        WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".distributon
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--FROM "UCL".distributon
--GROUP BY GROUPING SETS ((club), ());
--
--refresh materialized view club_distribution_performance;

-- Club's goal stats

--create materialized view club_goals_performance as
-- select 
--	case 
--		when grouping(club) = 1 then 'Total'
--		else club
--	end as club,
--	sum(goals) as total_goals,
--	sum(right_foot) as total_right_foot_goals,
--	sum(left_foot) as total_left_foot_goals,
--	sum(headers) as total_header_goals,
--	sum(others) as total_other_goals,
--	sum(penalties) as total_penalties,
--	sum(inside_area) as total_inside_goals,
--	sum(outside_areas) as total_outside_goals,
--	case 
--		WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".distributon
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--	from "UCL".goals
--	group by grouping sets ((club), ());
--
--refresh materialized view club_goals_performance;


-- Script for club's goalkeeping
--
--create materialized view club_goalkeeping_performance as
--select 
--	case 
--		when grouping(club) = 1 then 'Total'
--		else club
--	end as club,
--	sum(saved) + sum(conceded) as total_attempted,
--	sum(saved) as total_saved,
--	sum(conceded) as total_conceded,
--	sum(saved_penalties) as total_saved_penalties,
--	sum(cleansheets) as total_cleansheets,
--	sum("punches made") as total_saves_by_punches,
--	case 
--		WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".goalkeeping
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--from "UCL".goalkeeping
--group by grouping sets ((club), ());
--refresh materialized view club_goalkeeping_performance;
	
	
-- Script to get club attempts

--create materialized view club_attempts_performance as
--select
--	case 
--		when grouping(club) = 1 then 'Total'
--		else club
--	end as club,
--	sum(total_attempts) as total_attempts,
--	sum(on_target) as total_on_target,
--	sum(off_target) as total_off_target,
--	sum(blocked) as total_blocked,
--	case 
--		WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".attempts
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches
--from "UCL".attempts
--group by grouping sets((club), ());
--refresh materialized view club_attempts_performance;


-- Script to get club's key stats

--create materialized view club_keystats_performance as
--select 
--	case 
--		when grouping(club) = 1 then 'Total'
--		else club
--	end as club,
--	case 
--    	when grouping(club) = 1 then (
--	    	select sum(max_minutes)
--    		from (
--    			select club, Max(minutes_played) as max_minutes
--    			from "UCL".disciplinary
--	    		group by club
--    		) max_minutes_per_club
--    	) else max(minutes_played)
--    end as total_minutes_played,
--	case 
--		WHEN GROUPING(club) = 1 THEN (
--            SELECT SUM(max_matches)
--            FROM (
--                SELECT club, MAX(match_played) AS max_matches
--                FROM "UCL".attempts
--                GROUP BY club
--            ) max_matches_per_club
--        )
--        ELSE MAX(match_played) -- For individual rows, show max matches played
--    END AS total_matches,
--	sum(goals) as total_goals,
--	sum(assists) as total_assists,
--	round(avg(distance_covered)::numeric, 2) as average_distance_covered
--from "UCL".key_stats
--group by grouping sets ((club), ());
--refresh materialized view club_keystats_performance;


-- script to join club's performance key stats and attacking

--create view club_ks_att as
--select ckp.*, cap.total_corners, cap.total_dribbles, cap.total_offsides
--from club_keystats_performance ckp
--left join club_attacking_performance cap
--on ckp.club = cap.club;

-- script to join club's performance key stats, attacking and goals

--drop view if exists club_ks_att_go;
--create view club_ks_att_go as
--select ckap.*, cgp.total_right_foot_goals, cgp.total_left_foot_goals, cgp.total_header_goals, cgp.total_other_goals, cgp.total_penalties, cgp.total_inside_goals, cgp.total_outside_goals
--from club_ks_att ckap
--left join club_goals_performance cgp
--on ckap.club = cgp.club;

-- script to join club's performance key stats, attacking, goals, defending

--drop view if exists club_ks_att_go_df;
--create view club_ks_att_go_df as
--select ckag.*, cdp.total_balls_recovered, cdp.total_tackles, cdp.total_tackles_won, cdp.total_tackles_lost, cdp.total_clearance_attempted
--from club_ks_att_go ckag
--left join club_defending_performance cdp
--on ckag.club = cdp.club;

-- script to join club's performance key stats, attacking, goals, defending, distribution

--drop view if exists club_ks_att_go_df_dis;
--create view club_ks_att_go_df_dis as
--select  ckagd.*, cdp.avg_pass_accuracy, cdp.total_pass_attempted, cdp.total_pass_completed, cdp.avg_cross_accuracy, cdp.total_cross_attempted, cdp.total_cross_completed, cdp.total_freekicks_taken
--from club_ks_att_go_df ckagd
--left join club_distribution_performance cdp
--on ckagd.club = cdp.club;

-- script to join club's performance key stats, attacking, goals, defending, distribution, attempts

--drop view if exists club_ks_att_go_df_dis_atm;
--create view club_ks_att_go_df_dis_atm as
--select ckagdd.*, cap.total_attempts, cap.total_on_target, cap.total_off_target, cap.total_blocked
--from club_ks_att_go_df_dis ckagdd 
--left join club_attempts_performance cap 
--on ckagdd.club = cap.club;

-- script to join club's performance key stats, attacking, goals, defending, distribution, attempts, goalkeeping

--drop view if exists club_ks_att_go_df_dis_atm_gl;
--create view club_ks_att_go_df_dis_atm_gl as
--select ckagdda.*, cgp.total_attempted as total_saves_attempted, cgp.total_saved, cgp.total_conceded, cgp.total_saved_penalties, cgp.total_cleansheets, cgp.total_saves_by_punches
--from club_ks_att_go_df_dis_atm ckagdda
--left join club_goalkeeping_performance cgp 
--on ckagdda.club = cgp.club;

-- script to join club's performance key stats, attacking, goals, defending, distribution, attempts, goalkeeping, disciplinary

--drop view if exists club_ks_att_go_df_dis_atm_gl_dsc;
--create view club_ks_att_go_df_dis_atm_gl_dsc as
--select ckagddag.*, cdp.total_red, cdp.total_yellow, cdp.total_fouls_committed, cdp.total_fouls_suffered 
--from club_ks_att_go_df_dis_atm_gl ckagddag
--left join club_disciplinary_penalties cdp
--on ckagddag.club = cdp.club;
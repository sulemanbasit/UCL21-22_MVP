/* Script to pull out club's attacking performance */

/*SELECT 
    CASE 
        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
        ELSE club
    END AS club,
    SUM(assists) AS total_assists, 
    SUM(corner_taken) AS total_corners, 
    SUM(offsides) AS total_offsides, 
    SUM(dribbles) AS total_dribbles, 
    CASE 
        WHEN GROUPING(club) = 1 THEN (
            SELECT SUM(max_matches)
            FROM (
                SELECT club, MAX(match_played) AS max_matches
                FROM "UCL".attacking
                GROUP BY club
            ) max_matches_per_club
        )
        ELSE MAX(match_played) -- For individual rows, show max matches played
    END AS total_matches
FROM "UCL".attacking
GROUP BY GROUPING SETS ((club), ());*/


/* Script to get club's defending performance */

/*SELECT 
    CASE 
        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
        ELSE club
    END AS club,
    sum(balls_recoverd) as total_balls_recovered,
    sum(tackles) as total_tackles,
    sum(t_won) as total_tackles_won,
    sum(t_lost) as total_tackles_lost,
    sum(clearance_attempted) as total_clearance_attempted,
    CASE 
        WHEN GROUPING(club) = 1 THEN (
            SELECT SUM(max_matches)
            FROM (
                SELECT club, MAX(match_played) AS max_matches
                FROM "UCL".defending
                GROUP BY club
            ) max_matches_per_club
        )
        ELSE MAX(match_played) -- For individual rows, show max matches played
    END AS total_matches
FROM "UCL".defending
GROUP BY GROUPING SETS ((club), ());*/


/* Script to get club's disciplinary penalties */

/* SELECT 
    CASE 
        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
        ELSE club
    END AS club,
    sum(fouls_committed) as total_fouls_committed,
    sum(fouls_suffered) as total_fouls_suffered,
    sum(red) as total_red,
    sum(yellow) as total_yellow,
    case 
    	when grouping(club) = 1 then (
	    	select sum(max_minutes)
    		from (
    			select club, Max(minutes_played) as max_minutes
    			from "UCL".disciplinary
	    		group by club
    		) max_minutes_per_club
    	) else max(minutes_played)
    end as total_minutes_played,
    CASE 
        WHEN GROUPING(club) = 1 THEN (
            SELECT SUM(max_matches)
            FROM (
                SELECT club, MAX(match_played) AS max_matches
                FROM "UCL".disciplinary
                GROUP BY club
            ) max_matches_per_club
        )
        ELSE MAX(match_played) -- For individual rows, show max matches played
    END AS total_matches
FROM "UCL".disciplinary
GROUP BY GROUPING SETS ((club), ()); */

/* Script to get club's distribution stats */

/* SELECT 
    CASE 
        WHEN GROUPING(club) = 1 THEN 'Total' -- Label for total row
        ELSE club
    END AS club,
     -- Calculate pass accuracy based on completed/attempted passes
    ROUND((SUM(pass_completed) * 100.0) / NULLIF(SUM(pass_attempted), 0), 2) AS avg_pass_accuracy,
    SUM(pass_attempted) AS total_pass_attempted,
    SUM(pass_completed) AS total_pass_completed,
    -- Calculate cross accuracy the same way
    ROUND((SUM(cross_complted) * 100.0) / NULLIF(SUM(cross_attempted), 0), 2) AS avg_cross_accuracy,
    sum(cross_attempted) as total_cross_attempted,
    sum(cross_complted) as total_cross_completed,
    sum(freekicks_taken) as total_freekicks_taken,
    CASE 
        WHEN GROUPING(club) = 1 THEN (
            SELECT SUM(max_matches)
            FROM (
                SELECT club, MAX(match_played) AS max_matches
                FROM "UCL".distributon
                GROUP BY club
            ) max_matches_per_club
        )
        ELSE MAX(match_played) -- For individual rows, show max matches played
    END AS total_matches
FROM "UCL".distributon
GROUP BY GROUPING SETS ((club), ()); */

-- Club's goal stats
select 
	case 
		when grouping(club) = 1 then 'Total'
		else club
	end as club,
	sum(goals) as total_goals,
	sum(right_foot) as total_right_foot_goals,
	sum(left_foot) as total_left_foot_goals,
	sum(headers) as total_header_goals,
	sum(others) as total_other_goals,
	sum(penalties) as total_penalties,
	sum(inside_area) as total_inside_goals,
	sum(outside_areas) as total_outside_goals,
	case 
		WHEN GROUPING(club) = 1 THEN (
            SELECT SUM(max_matches)
            FROM (
                SELECT club, MAX(match_played) AS max_matches
                FROM "UCL".distributon
                GROUP BY club
            ) max_matches_per_club
        )
        ELSE MAX(match_played) -- For individual rows, show max matches played
    END AS total_matches
	from "UCL".goals
	group by grouping sets ((club), ());
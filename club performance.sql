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
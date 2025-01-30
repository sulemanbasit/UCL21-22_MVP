/* SELECT DISTINCT club
FROM "UCL".attacking;*/

/*select *
from "UCL".attacking
order by club, assists desc ;*/

/*select club, 
sum(assists) as Total_Assists,
sum(corner_taken) as Total_Corners_Taken,
sum(offsides) as Total_Offsides,
sum(dribbles) as Total_Dribbles,
sum(match_played) as Total_Matches
from "UCL".attacking a 
group by club 
order by club;*/

/*SELECT case 
	when grouping(club) = 1 then 'Total'
	else club
	end as club,
    SUM(assists) AS total_assists, 
    SUM(corner_taken) AS total_corners, 
    SUM(offsides) AS total_offsides, 
    SUM(dribbles) AS total_dribbles, 
    case 
    	when grouping (club) = 1 then sum(match_played)
    	else max(match_played)
    end as total_matches
FROM "UCL".attacking
GROUP BY GROUPING SETS ((club), ());*/

SELECT 
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
GROUP BY GROUPING SETS ((club), ());
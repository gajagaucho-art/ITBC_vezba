-- 1
select *
from matches_flat 
where attendance > 40000 and kickoff_ts >= '2025-03-01' and kickoff_ts < '2025-04-01';
--2 utakmice
--2
select 
home_goals, away_goals,
sum(home_goals + away_goals) as uk_golova
from matches_flat  
where home_goals  is not null and away_goals is not null
group by home_goals, away_goals
order by uk_golova desc ; --36 kombinacija
--3
select * from stadiums where stadium_name ilike '%park%'; --6 stadiona
--
select coalesce(date(kickoff_ts),'nepoznato'),
coalesce(home_team, 'nepoznato'),
coalesce(away_team, 'nepoznato'),
 coalesce(attendance,0),
 coalesce(weather,'nepoznato')
from matches_flat where attendance is null or weather is null ; --89 utakmica



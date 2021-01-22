# Qn 1
select distinct sector
from shoppingmalls
order by sector asc;

#Qn 2 
select mall_name
from shoppingmalls
where mall_name like "%city%";

#Qn 3
select distinct surname, count(surname) as amt 
from demo
group by surname 
order by amt desc limit 3;

#Qn 4 
select age, count(distinct ID) as AMT
from demo
group by age
order by AMT desc;

#Qn 5 
select count(essentialsrv) as es1
from demo
where EssentialSrv = 1;

select count(essentialsrv) as t_es
from demo;

#5 final query
select (es1/t_es) as PercOFEssen
from (select count(essentialsrv) as es1
from demo
where EssentialSrv = 1) as newtable ,(select count(essentialsrv) as t_es
from demo) as newtable2;

#Qn 6 
select count(gender) as total_female
from demo
where gender = 0;

select count(EssentialSrv) as f_es
from demo
where gender = 0 and essentialsrv = 1;

#6 final query 
select (f_es/total_female) as PercOFEssenFemale
from (select count(gender) as total_female
from demo
where gender = 0) as newtable ,(select count(EssentialSrv) as f_es
from demo
where gender = 0 and essentialsrv = 1) as newtable2;

#Qn 7
select count(gender) as m_es
from demo 
where (age between 22 and 45) and gender = 1 and EssentialSrv = 1 ;

select count(gender) as total_m
from demo
where (age between 22 and 45) and gender = 1;

#7 final query 
select (m_es/total_m) as PercOFEssenMale22to45yo
from (select count(gender) as m_es
from demo 
where (age between 22 and 45) and gender = 1 and EssentialSrv = 1) as newtable1, 
(select count(gender) as total_m
from demo
where (age between 22 and 45) and gender = 1) as newtable2;

#Qn 8 
select count(distinct c.ID) as UniquePpl
from checkin as c, shoppingmalls as s
where s.sector = "west";

#Qn 9 
select c.location, count( c.id) as AMT
from checkin as c inner join shoppingmalls as s
on c.Location = s.Mall_ID
where s.sector = "east"
group by c.location 
order by AMT desc limit 3;

#Qn 10
select c.location, count( c.id) as AMT
from checkin as c inner join shoppingmalls as s
on c.Location = s.Mall_ID
where s.sector = "west" and (c.hour >= 18)
group by c.location 
order by AMT desc limit 3;

#Qn 11
select s.sector, count(c.id) as AmtOfCheckIns
from shoppingmalls as s inner join checkin as c
on c.Location = s.Mall_ID
group by s.sector;

#Qn 12 
select count(distinct c.id) as PplTBP
from checkin as c inner join shoppingmalls as s
on c.Location = s.Mall_ID
where s.mall_name = "Tiong Bahru Plaza" and (c.month between 5 and 6 ) and (c.day between 1 and 28) and (c.year = 2020);

#Qn 13
select count(distinct c.id) as PplTBP
from checkin as c inner join shoppingmalls as s
on c.Location = s.Mall_ID
inner join demo as d
on d.id = c.id
where s.mall_name = "Tiong Bahru Plaza" and (c.month between 5 and 6 ) and (c.day between 1 and 28) and (c.year = 2020) and d.gender = 0 and (d.age >= 40);

#Qn 14 
select c.id, c.day, c.month, count(c.id) as amt
from checkin as c, shoppingmalls as s
where c.Location = s.mall_id
and s.Mall_Name in  ("Tiong Bahru Plaza", "Alexandra Central")
group by c.id, c.day, c.month
having amt > 1;

#Qn 15 
select distinct s.mall_name, count(c.id) as Amt 
from shoppingmalls as s, checkin as c
where c.Crowdedness = 1 and s.Mall_ID =c.location
group by s.Mall_Name;

#Qn 16 
select c.location, count(c.id) FemaleAmt
from demo as d, checkin as c
where d.gender = 0 and d.id = c.id
group by c.location;

select c.location, count(c.id) MaleAmt
from demo as d, checkin as c
where d.gender = 1 and d.id = c.id
group by c.location;

#16 final query
select *
from (select c.location, count(c.id) FemaleAmt
from demo as d, checkin as c
where d.gender = 0 and d.id = c.id
group by c.location) f
natural join 
(select c.location, count(c.id) MaleAmt
from demo as d, checkin as c
where d.gender = 1 and d.id = c.id
group by c.location)m
where f.FemaleAmt > m.MaleAmt;

#Qn 17
select id as ID, location as Location, count(id) as checkInAmt
from checkin
group by ID, Location
having checkInAmt > 1 
order by checkInAmt desc;

#Qn 18
select id, location, count(id) as checkInAmt 
from checkin 
group by id, location
having checkInAmt > 1;

#Qn 19
select distinct tt.mobileno, tt.NearByMobileNo
from tracetogether as tt, checkin as c 
where c.day = tt.day and c.month = tt.month and c.year = tt.year ;


#Qn 20
#check for <8 no. and non-numeric
select mobileno
from checkin
where length(mobileno) != 8 or MobileNO regexp'[a-z]' ;



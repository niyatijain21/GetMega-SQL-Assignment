select
	count(a.user_id) as q1a,
	b.user_id as q1b,
	c.user_id as q1c,
	d.user_id as q1d,
	e.user_id as q1e,
	c.user_id and d.user_id as d1f
from
	table1 as a
join
	table2 as b
on a.user_id=b.user_id
join
(
	select
		user_id
	from
		table1
	where 
		user_id not in (select user_id from table2) 
) as c
on a.user_id=c.user_id
join
(
	select
		user_id
	from
		table2
	where 
		user_id not in (select user_id from table1) 
) as d
on a.user_id=d.user_id
join
(
	select
		user_id
	from
		table2
	where 
		user_id in (select user_id from table1) 
) as e
on a.user_id=e.user_id	


	
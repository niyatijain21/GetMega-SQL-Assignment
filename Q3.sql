select
	subject_name,
	count(student_id) as number_of_students
from
(
	select
		subject_id,
		subject_name
	from
		subject
) as a
left join
(
	select
		student_id,
		subject_id
	from
		student
) as b
on a.subject_id=b.subject_id
where
	count(student_id)>2
group by
	subject_name
order by
	count(subject_id)


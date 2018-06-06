SELECT
	teachers.fio_teacher AS ФИО,
	subjects.subject_name AS Предмет
FROM
	(
		teachers
		JOIN teacher_subject ON teachers.id_teacher = teacher_subject.id_teacher
	)
JOIN subjects ON teacher_subject.id_subject = subjects.id_subject
WHERE
	teachers.fio_teacher = 'Соколов Александр Владиславович'

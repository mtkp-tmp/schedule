-- Вызов функции:
-- SELECT * FROM take_schedule_on_date('06-06-2018');

CREATE OR REPLACE FUNCTION take_schedule_on_date(date)
RETURNS TABLE(День_недели VARCHAR, № int, Время VARCHAR, Группа VARCHAR,
Предмет VARCHAR, Преподаватель VARCHAR, Каб VARCHAR) AS
$$
	SELECT
		to_char(schedule."_day", 'Day (DD Month YYYY)'),
		calls_full.id_calls_full,
		to_char(calls_full.call_time_start, 'HH.MI')|| ' : ' || to_char(calls_full.call_time_end, 'HH.MI'),
		groups.name_group,
		subjects.subject_name,
		teachers.fio_teacher,
		cabinets.name_cab
	FROM
		((((schedule JOIN calls_full ON schedule.id_calls_full = calls_full.id_calls_full) JOIN
		groups ON schedule.id_group = groups.id_group) JOIN teachers ON schedule.id_teacher=
		teachers.id_teacher) JOIN subjects ON schedule.id_subject = subjects.id_subject) JOIN
		cabinets ON schedule.id_cab = cabinets.id_cab
	WHERE
		schedule.id_calls_full = calls_full.id_calls_full AND
		schedule.id_group = groups.id_group AND
		schedule.id_teacher = teachers.id_teacher AND
		schedule.id_subject = subjects.id_subject AND
		schedule.id_cab = cabinets.id_cab AND
		schedule."_day" = $1
	ORDER BY calls_full.id_calls_full ASC
$$
LANGUAGE sql;

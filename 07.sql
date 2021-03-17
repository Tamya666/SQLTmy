# 7.查询所有课程成绩大于60分的学生的学号、姓名
SELECT
	a.s_id,
	t.s_name 
FROM
	( SELECT s_id, count( c_id ) AS cnt FROM score WHERE score > 60 GROUP BY s_id ) AS a
	INNER JOIN ( SELECT s_id, count( c_id ) AS cnt FROM score GROUP BY s_id ) AS b ON a.s_id = b.s_id
	INNER JOIN student AS t ON a.s_id = t.s_id 
WHERE
	a.cnt = b.cnt
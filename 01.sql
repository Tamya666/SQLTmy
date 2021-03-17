# 查询课程编号为“01”的课程比“02”的课程成绩低的所有学生的学号

SELECT
	a.s_id "s_no",
	c.s_name "name",
	a.s_score "01",
	b.s_score "02" 
FROM
	( SELECT s_id, c_id, s_score FROM score WHERE c_id = '0001' ) AS a
	INNER JOIN ( SELECT s_id, c_id, s_score FROM score WHERE c_id = '0002' ) AS b ON a.s_id = b.s_id
	INNER JOIN student AS c ON c.s_id = a.s_id 
WHERE
	a.s_score < b.s_score
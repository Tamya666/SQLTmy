# 查询学过编号为“0001”的课程并且也学过编号为“0002”的课程的学生的学号、姓名
SELECT
	s_id,
	s_name 
FROM
	student 
WHERE
	s_id IN (
	SELECT
		a.s_id 
	FROM
		( SELECT s_id, c_id FROM Score WHERE c_id = "0001" ) AS a
	INNER JOIN ( SELECT s_id, c_id FROM Score WHERE c_id = "0002" ) AS b ON a.s_id = b.s_id 
	)
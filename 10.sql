# 查询和0001号同学所学课程完全相同的其他同学的学号
SELECT
	* 
FROM
	student 
WHERE
	s_id IN (
	SELECT
		s_id 
	FROM
		score 
	WHERE
		s_id != '0001' 
	GROUP BY
		s_id 
	HAVING
		COUNT( DISTINCT c_id ) = ( SELECT COUNT( DISTINCT c_id ) FROM score WHERE s_id = '0001' ) 
	) 
	AND s_id NOT IN (
	SELECT DISTINCT
		s_id 
	FROM
		score 
WHERE
	c_id NOT IN ( SELECT c_id FROM score WHERE s_id = '0001' )
# 8. 查询没有学全所有课的学生的学号、姓名
SELECT
	st.* 
FROM
	student AS st
	LEFT JOIN score AS sc ON st.s_id = sc.s_id 
GROUP BY
	st.s_id 
HAVING
	COUNT( DISTINCT sc.c_id ) < ( SELECT COUNT( c_id ) FROM course )

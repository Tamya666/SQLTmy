# 查询至少有一门课与学号为“0001”的学生所学课程相同的学生的学号和姓名
SELECT
	st.s_id,
	st.s_name 
FROM
	( SELECT DISTINCT s_id FROM score WHERE c_id IN ( SELECT c_id FROM score WHERE s_id = '0001' ) AND s_id != '0001' ) AS sc
	INNER JOIN student AS st ON sc.s_id = st.s_id
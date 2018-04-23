PARAMETERS p_cur,str_query
b = SQLEXEC(con_bd,str_query,p_cur)
AFIELDS(p_cur_fields,p_cur)
SELECT &p_cur
SCAN
	FOR i = 1 TO ALEN(p_cur_fields,1)
		IF ISNULL(&p_cur..&p_cur_fields[i,1])
			IF (p_cur_fields[i,2]#'I')
				replace &p_cur_fields[i,1] WITH ''
			ELSE
				replace &p_cur_fields[i,1] WITH 0
			ENDIF
		ENDIF
	ENDFOR 
ENDSCAN 
IF RECCOUNT(p_cur) = 0
	APPEND BLANK
ENDIF
GO TOP
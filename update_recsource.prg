PARAMETERS p_form,str_query
IF TYPE('str_query') = 'L'
	DO CASE 
		CASE cur_n_ceh= '105'
			str_query = "select * from zay_tmp_bpp_view"
		CASE cur_n_ceh= '110'
			str_query = "select * from zay_tmp_ved_t_view"
		CASE cur_n_ceh= '111'
			str_query = "select * from zay_tmp_kb1_view"
		OTHERWISE  
			str_query = "SELECT * FROM zay_tmp_ceh_view where n_ceh = "+cur_n_ceh
	ENDCASE 
ENDIF 
cur_table = p_form.ex_grid1.p_odatagrid.RecordSource
p_form.ex_grid1.p_odatagrid.RecordSource = ''
DO update_table WITH cur_table,str_query
p_form.ex_grid1.p_odatagrid.RecordSource = cur_table
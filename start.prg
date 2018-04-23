SET PATH TO 'F:\PRINT\IAM\LIBRARY\CLAS\'
PUBLIC nom_ch,naimz_dlin,family,con_bd,cur_n_ceh
cConnString="driver={SQL Server};SERVER=nitel-hp;uid=ldo;pwd=IfLyyz4sCJ;DATABASE=asyipw;WSID=VFP;APP=VFP;"
con_bd=SQLSTRINGCONNECT(cConnString, .T.)
cur_n_ceh = INPUTBOX("002(цех),105(БПП),110(Вед. техн),111(КБ-1)")
family = ""
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
DO update_table WITH 'main_cur',str_query
temp_baz='main_cur'
naimz_dlin = 'Заявки'
_screen.WindowState=2
DO FORM main_window

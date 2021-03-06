$PBExportHeader$w_processui_main.srw
forward
global type w_processui_main from window
end type
type st_6 from statictext within w_processui_main
end type
type st_5 from statictext within w_processui_main
end type
type st_4 from statictext within w_processui_main
end type
type st_3 from statictext within w_processui_main
end type
type st_2 from statictext within w_processui_main
end type
type st_1 from statictext within w_processui_main
end type
type cb_3 from commandbutton within w_processui_main
end type
type cb_2 from commandbutton within w_processui_main
end type
type cb_1 from commandbutton within w_processui_main
end type
type ln_1 from line within w_processui_main
end type
end forward

global type w_processui_main from window
integer x = 201
integer y = 200
integer width = 2053
integer height = 1084
boolean titlebar = true
string title = "Running Processes User Interfaces"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79416533
boolean center = true
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ln_1 ln_1
end type
global w_processui_main w_processui_main

on w_processui_main.create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ln_1=create ln_1
this.Control[]={this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.ln_1}
end on

on w_processui_main.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ln_1)
end on

type st_6 from statictext within w_processui_main
integer x = 731
integer y = 500
integer width = 1198
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Each of these samples used shared objects to implement multi-threading."
boolean focusrectangle = false
end type

type st_5 from statictext within w_processui_main
integer x = 731
integer y = 164
integer width = 1198
integer height = 312
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This application contains examples of how to keep your users informed during a long running process.  Click on a button on the left to sample the three different techniques."
boolean focusrectangle = false
end type

type st_4 from statictext within w_processui_main
integer x = 731
integer y = 64
integer width = 827
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "UI for Long Running Processes"
boolean focusrectangle = false
end type

type st_3 from statictext within w_processui_main
integer x = 73
integer y = 612
integer width = 503
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Alternate Step Display"
boolean focusrectangle = false
end type

type st_2 from statictext within w_processui_main
integer x = 73
integer y = 344
integer width = 503
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Step Display"
boolean focusrectangle = false
end type

type st_1 from statictext within w_processui_main
integer x = 73
integer y = 76
integer width = 503
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progress Meter"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_processui_main
integer x = 146
integer y = 704
integer width = 398
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Launch Process"
end type

event clicked;nvo_progresssrv_stepdisplay2 lnv_psrv
String ls_error

lnv_psrv = Create nvo_progresssrv_stepdisplay2

If lnv_psrv.of_startprocess(ls_error) <> 1 Then
	
	MessageBox("An Error Occurred",ls_error)
	
End If

end event

type cb_2 from commandbutton within w_processui_main
integer x = 146
integer y = 440
integer width = 398
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Launch Process"
end type

event clicked;nvo_progresssrv_stepdisplay lnv_psrv
String ls_error

lnv_psrv = Create nvo_progresssrv_stepdisplay

If lnv_psrv.of_startprocess(ls_error) <> 1 Then
	
	MessageBox("An Error Occurred",ls_error)
	
End If

end event

type cb_1 from commandbutton within w_processui_main
integer x = 146
integer y = 176
integer width = 398
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Launch Process"
end type

event clicked;nvo_progresssrv_progressmeter lnv_psrv
String ls_error

lnv_psrv = Create nvo_progresssrv_progressmeter

If lnv_psrv.of_startprocess(ls_error) <> 1 Then
	
	MessageBox("An Error Occurred",ls_error)
	
End If

end event

type ln_1 from line within w_processui_main
long linecolor = 8388608
integer linethickness = 1
integer beginx = 658
integer beginy = 40
integer endx = 658
integer endy = 928
end type


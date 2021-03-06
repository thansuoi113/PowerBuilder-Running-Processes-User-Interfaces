$PBExportHeader$w_progressui_stepdisplay.srw
forward
global type w_progressui_stepdisplay from window
end type
type dw_1 from datawindow within w_progressui_stepdisplay
end type
type st_2 from statictext within w_progressui_stepdisplay
end type
type cb_1 from commandbutton within w_progressui_stepdisplay
end type
type st_1 from statictext within w_progressui_stepdisplay
end type
type p_animation from picture within w_progressui_stepdisplay
end type
type gb_1 from groupbox within w_progressui_stepdisplay
end type
end forward

global type w_progressui_stepdisplay from window
integer x = 251
integer y = 252
integer width = 1559
integer height = 1036
boolean titlebar = true
string title = "Progress"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
boolean center = true
dw_1 dw_1
st_2 st_2
cb_1 cb_1
st_1 st_1
p_animation p_animation
gb_1 gb_1
end type
global w_progressui_stepdisplay w_progressui_stepdisplay

type variables

Private:

nvo_progresssrv_stepdisplay			inv_master

Boolean										ib_cancelpending

Boolean										ib_closeisauthorized

Integer										ii_currentstep = 1

end variables

forward prototypes
public function integer of_authorizeclose ()
public function integer of_incrementstep (integer ai_amountofincrement)
public function integer of_setmaster (nvo_progresssrv_stepdisplay anv_progresssrv)
end prototypes

public function integer of_authorizeclose ();
//The progress service will authorize the close before closing the window.
ib_closeisauthorized = True

Return 1

end function

public function integer of_incrementstep (integer ai_amountofincrement);Int li_row

//Go to the next step

li_row = dw_1.Find("status = 1",0,dw_1.RowCount())

If li_row > 0 Then
	dw_1.SetItem(li_row,"status",2)
	dw_1.SetItem(li_row +1,"status",1)
End If

Return 1

end function

public function integer of_setmaster (nvo_progresssrv_stepdisplay anv_progresssrv);
//Save the progress service instance so we can talk to it later...
inv_master = anv_progresssrv

Return 1

end function

on w_progressui_stepdisplay.create
this.dw_1=create dw_1
this.st_2=create st_2
this.cb_1=create cb_1
this.st_1=create st_1
this.p_animation=create p_animation
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.st_2,&
this.cb_1,&
this.st_1,&
this.p_animation,&
this.gb_1}
end on

on w_progressui_stepdisplay.destroy
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.p_animation)
destroy(this.gb_1)
end on

event closequery;

//If the close is authorized....
//Close is authorized if the process has stopped.  That occurs if the process
//completes or has honored a cancellation request.  If the close is not 
//authorized, we now request a cancellation.
If ib_closeisauthorized Then
	Return 0
Else
	If Not ib_cancelpending Then
		inv_master.of_requestcancellation()
	End If
	Return 1
End If



end event

type dw_1 from datawindow within w_progressui_stepdisplay
integer x = 475
integer y = 380
integer width = 928
integer height = 328
integer taborder = 10
string title = "none"
string dataobject = "d_stepdisplay"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_progressui_stepdisplay
integer x = 475
integer y = 296
integer width = 576
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Steps"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_progressui_stepdisplay
integer x = 1129
integer y = 796
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;
this.enabled = false

ib_cancelpending = true

inv_master.of_requestcancellation()
end event

type st_1 from statictext within w_progressui_stepdisplay
integer x = 475
integer y = 128
integer width = 576
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Processing, Please Wait..."
boolean focusrectangle = false
end type

type p_animation from picture within w_progressui_stepdisplay
integer x = 128
integer y = 92
integer width = 256
integer height = 224
string picturename = "gears.gif"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_progressui_stepdisplay
integer x = 55
integer y = 728
integer width = 1445
integer height = 16
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type


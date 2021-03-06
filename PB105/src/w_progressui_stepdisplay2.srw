$PBExportHeader$w_progressui_stepdisplay2.srw
forward
global type w_progressui_stepdisplay2 from window
end type
type st_step from statictext within w_progressui_stepdisplay2
end type
type cb_1 from commandbutton within w_progressui_stepdisplay2
end type
type st_1 from statictext within w_progressui_stepdisplay2
end type
type p_animation from picture within w_progressui_stepdisplay2
end type
type gb_1 from groupbox within w_progressui_stepdisplay2
end type
end forward

global type w_progressui_stepdisplay2 from window
integer x = 251
integer y = 252
integer width = 1559
integer height = 668
boolean titlebar = true
string title = "Progress"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
boolean center = true
st_step st_step
cb_1 cb_1
st_1 st_1
p_animation p_animation
gb_1 gb_1
end type
global w_progressui_stepdisplay2 w_progressui_stepdisplay2

type variables

Private:

nvo_progresssrv_stepdisplay2		inv_master

Boolean										ib_cancelpending

Boolean										ib_closeisauthorized

Integer										ii_currentstep = 1

end variables

forward prototypes
public function integer of_setmaster (nvo_progresssrv_stepdisplay2 anv_progresssrv)
public function integer of_authorizeclose ()
public function integer of_nextstep (string as_step)
end prototypes

public function integer of_setmaster (nvo_progresssrv_stepdisplay2 anv_progresssrv);
//Save the progress service instance so we can talk to it later...
inv_master = anv_progresssrv

Return 1

end function

public function integer of_authorizeclose ();
//The progress service will authorize the close before closing the window.
ib_closeisauthorized = True

Return 1

end function

public function integer of_nextstep (string as_step);
//Display the next step
st_step.Text = as_step

Return 1

end function

on w_progressui_stepdisplay2.create
this.st_step=create st_step
this.cb_1=create cb_1
this.st_1=create st_1
this.p_animation=create p_animation
this.gb_1=create gb_1
this.Control[]={this.st_step,&
this.cb_1,&
this.st_1,&
this.p_animation,&
this.gb_1}
end on

on w_progressui_stepdisplay2.destroy
destroy(this.st_step)
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

type st_step from statictext within w_progressui_stepdisplay2
integer x = 475
integer y = 204
integer width = 1015
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "..."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_progressui_stepdisplay2
integer x = 1129
integer y = 432
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

type st_1 from statictext within w_progressui_stepdisplay2
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

type p_animation from picture within w_progressui_stepdisplay2
integer x = 110
integer y = 68
integer width = 219
integer height = 192
string picturename = "gears.gif"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_progressui_stepdisplay2
integer x = 55
integer y = 364
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


$PBExportHeader$w_progressui_progressmeter.srw
forward
global type w_progressui_progressmeter from window
end type
type cb_1 from commandbutton within w_progressui_progressmeter
end type
type st_1 from statictext within w_progressui_progressmeter
end type
type hpb_process from hprogressbar within w_progressui_progressmeter
end type
type p_animation from picture within w_progressui_progressmeter
end type
end forward

global type w_progressui_progressmeter from window
integer x = 251
integer y = 252
integer width = 1609
integer height = 788
boolean titlebar = true
string title = "Progress"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
boolean center = true
cb_1 cb_1
st_1 st_1
hpb_process hpb_process
p_animation p_animation
end type
global w_progressui_progressmeter w_progressui_progressmeter

type variables

Private:

nvo_progresssrv_progressmeter		inv_master

Boolean										ib_cancelpending

Boolean										ib_closeisauthorized

end variables

forward prototypes
public function integer of_authorizeclose ()
public function integer of_incrementprogress (integer ai_amountofincrement)
public function integer of_setmaster (nvo_progresssrv_progressmeter anv_progresssrv)
end prototypes

public function integer of_authorizeclose ();
//The progress service will authorize the close before closing the window.
ib_closeisauthorized = True

Return 1

end function

public function integer of_incrementprogress (integer ai_amountofincrement);
//Move the meter
hpb_process.offsetpos(ai_amountofincrement)

Return 1

end function

public function integer of_setmaster (nvo_progresssrv_progressmeter anv_progresssrv);
//Save the progress service instance so we can talk to it later...
inv_master = anv_progresssrv

Return 1

end function

on w_progressui_progressmeter.create
this.cb_1=create cb_1
this.st_1=create st_1
this.hpb_process=create hpb_process
this.p_animation=create p_animation
this.Control[]={this.cb_1,&
this.st_1,&
this.hpb_process,&
this.p_animation}
end on

on w_progressui_progressmeter.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.hpb_process)
destroy(this.p_animation)
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

type cb_1 from commandbutton within w_progressui_progressmeter
integer x = 1170
integer y = 576
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

type st_1 from statictext within w_progressui_progressmeter
integer x = 73
integer y = 356
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

type hpb_process from hprogressbar within w_progressui_progressmeter
integer x = 73
integer y = 440
integer width = 1445
integer height = 56
unsignedinteger maxposition = 100
integer setstep = 10
end type

type p_animation from picture within w_progressui_progressmeter
integer x = 73
integer y = 64
integer width = 1426
integer height = 224
string picturename = "flyingpapers.gif"
boolean focusrectangle = false
end type


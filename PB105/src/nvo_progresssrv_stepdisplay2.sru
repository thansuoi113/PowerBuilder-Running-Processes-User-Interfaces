$PBExportHeader$nvo_progresssrv_stepdisplay2.sru
forward
global type nvo_progresssrv_stepdisplay2 from nonvisualobject
end type
end forward

global type nvo_progresssrv_stepdisplay2 from nonvisualobject
event ue_processcomplete ( )
end type
global nvo_progresssrv_stepdisplay2 nvo_progresssrv_stepdisplay2

type variables

Private:

w_progressui_stepdisplay2 iw_progress

Boolean	 ib_cancel

end variables
forward prototypes
public function boolean of_iscancelpending ()
public function integer of_nextstep (string as_step)
public function integer of_requestcancellation ()
public function integer of_startprocess (ref string as_error)
end prototypes

event ue_processcomplete;
iw_progress.of_authorizeclose()

close(iw_progress)
end event

public function boolean of_iscancelpending ();//====================================================================
// Function: nvo_progresssrv_stepdisplay2.of_iscancelpending()
//--------------------------------------------------------------------
// Description: whether the user has clicked "Cancel"
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/05/05
//--------------------------------------------------------------------
// Usage: nvo_progresssrv_stepdisplay2.of_iscancelpending ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return ib_cancel
end function

public function integer of_nextstep (string as_step);//====================================================================
// Function: nvo_progresssrv_stepdisplay2.of_nextstep()
//--------------------------------------------------------------------
// Description: This function relays the message from the shared object session back to the main thread where the step meter is displayed.
//--------------------------------------------------------------------
// Arguments:
// 	string	as_step	the new step the process has started
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/05/05
//--------------------------------------------------------------------
// Usage: nvo_progresssrv_stepdisplay2.of_nextstep ( string as_step )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

iw_progress.of_nextstep(as_step)

Return 1

end function

public function integer of_requestcancellation ();//====================================================================
// Function: nvo_progresssrv_stepdisplay2.of_requestcancellation()
//--------------------------------------------------------------------
// Description: This function is called by the progress window in the main  session.  A request is logged to cancel the process.  As soon as the process itself can honor the request, the process will stop.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/05/05
//--------------------------------------------------------------------
// Usage: nvo_progresssrv_stepdisplay2.of_requestcancellation ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

ib_cancel = True

Return 1

end function

public function integer of_startprocess (ref string as_error);//====================================================================
// Function: nvo_progresssrv_stepdisplay2.of_startprocess()
//--------------------------------------------------------------------
// Description: This function does all the work necessary to launch the process including registering and executing the shared object, opening the progress window, and passing itself into both to enable the messaging through it.
//--------------------------------------------------------------------
// Arguments:
// 	ref	string	as_error	error text if an error occurrs
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/05/05
//--------------------------------------------------------------------
// Usage: nvo_progresssrv_stepdisplay2.of_startprocess ( ref string as_error )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

nvo_process_stepdisplay2 lnv_process

//Open the progress window
Open(iw_progress,"w_progressui_stepdisplay2")

//Let the progress window know whose boss
iw_progress.of_setmaster(This)

//Register the process
If SharedObjectRegister("nvo_process_stepdisplay2","process") <> SUCCESS! Then
	as_error = "Unable to register shared object"
	Return -1
End If

//Grab the process
If SharedObjectGet("process",lnv_process) <> SUCCESS! Then
	as_error = "Unable to get the shared object instance"
	Return -2
End If

//By unregistering the shared object the object will be destroyed when the
//last reference to it is lost and that is when lnv_process goes out of 
//scope and that is when this function ends.
SharedObjectUnRegister("process")

//Start the process (POST)
lnv_process.Post of_startprocess(This)

Return 1

end function

on nvo_progresssrv_stepdisplay2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_progresssrv_stepdisplay2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


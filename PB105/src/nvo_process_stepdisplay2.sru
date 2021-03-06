$PBExportHeader$nvo_process_stepdisplay2.sru
forward
global type nvo_process_stepdisplay2 from nonvisualobject
end type
end forward

global type nvo_process_stepdisplay2 from nonvisualobject
end type
global nvo_process_stepdisplay2 nvo_process_stepdisplay2

forward prototypes
public function integer of_startprocess (nvo_progresssrv_stepdisplay2 anv_progresssrv)
end prototypes

public function integer of_startprocess (nvo_progresssrv_stepdisplay2 anv_progresssrv);//====================================================================
// Function: nvo_process_stepdisplay2.of_startprocess()
//--------------------------------------------------------------------
// Description: This function is designed to mimic what a real-life long  running process would do.  For simplicity's sake, this function loops while concatenating a string mimic a process.
//--------------------------------------------------------------------
// Arguments:
// 	nvo_progresssrv_stepdisplay2	anv_progresssrv	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/05/05
//--------------------------------------------------------------------
// Usage: nvo_process_stepdisplay2.of_startprocess ( nvo_progresssrv_stepdisplay2 anv_progresssrv )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_c,ll_c2
String ls_t


Do While ll_c < 3 //3 is number of steps

	//Update the step display, showing which step we are on.
	If ll_c = 0 Then
		anv_progresssrv.Post of_nextstep("Retrieving Records from File")
	ElseIf ll_c = 1 Then
		anv_progresssrv.Post of_nextstep("Parsing and Validating Records")
	ElseIf ll_c = 2 Then
		anv_progresssrv.Post of_nextstep("Writing Records to Database")
	End If
	
	//This is some code to cause this function t0
	//take a long time.
	For ll_c2 = 1 To 40000
		ls_t += "."
	Next
	ls_t = ""
	
	//If the progress service has received a cancel request then
	//stop the processing now.
	If anv_progresssrv.of_iscancelpending() Then Exit
	
	ll_c ++
Loop

//Let the progress service know that we're complete.
anv_progresssrv.Event ue_processcomplete()

Return 1

end function

on nvo_process_stepdisplay2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_process_stepdisplay2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


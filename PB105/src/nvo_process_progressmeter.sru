$PBExportHeader$nvo_process_progressmeter.sru
forward
global type nvo_process_progressmeter from nonvisualobject
end type
end forward

global type nvo_process_progressmeter from nonvisualobject
end type
global nvo_process_progressmeter nvo_process_progressmeter

forward prototypes
public function integer of_startprocess (nvo_progresssrv_progressmeter anv_progresssrv)
end prototypes

public function integer of_startprocess (nvo_progresssrv_progressmeter anv_progresssrv);//====================================================================
// Function: nvo_process_progressmeter.of_startprocess()
//--------------------------------------------------------------------
// Description: This function is designed to mimic what a real-life long running process would do.  For simplicity's sake, this function loops while concatenating a string mimic a process.
//--------------------------------------------------------------------
// Arguments:
// 	nvo_progresssrv_progressmeter	anv_progresssrv	The progress service
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/05/05
//--------------------------------------------------------------------
// Usage: nvo_process_progressmeter.of_startprocess ( nvo_progresssrv_progressmeter anv_progresssrv )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_c,ll_c2
String ls_t


Do While ll_c < 100
	
	//This is some code to cause this function t0
	//take a long time.
	For ll_c2 = 1 To 8000
		ls_t += "*"
	Next
	ls_t = ""
	
	//Send message to the progress service to increment the meter
	anv_progresssrv.Post of_incrementprogress(1)
	
	//If the progress service has received a cancel request then
	//stop the processing now.
	If anv_progresssrv.of_iscancelpending() Then Exit
	
	ll_c ++
Loop

//Let the progress service know that we're complete.
anv_progresssrv.Event ue_processcomplete()


Return 1

end function

on nvo_process_progressmeter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_process_progressmeter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


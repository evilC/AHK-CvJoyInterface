; Gui Example
; Allow switching of vJoy IDs at run-time.
; Have the helper classes automatically handle relinquishing devices as we switch.

#SingleInstance, force
#include CvJoyInterface.ahk

; Create an object from vJoy Interface Class.
vJoyInterface := new CvJoyInterface()

; Was vJoy installed and the DLL Loaded?
if (!vJoyInterface.vJoyEnabled()){
	; Show log of what happened
	Msgbox % vJoyInterface.LoadLibraryLog
	ExitApp
}

; Create The GUI
Gui, Add, Text, x20 y10, vJoy ID
Gui, Add, DropDownList, x80 yp-2 w50 vVJoyID gOptionChanged, 1||2|3|4|5|6|7|8|9|10|11|12|13|14|15|16
Gui, Add, Text, x20 y30, Status:
Gui, Add, Text, x80 yp vStickStatus w50 Center, 
Gui, Show, W150
OnExit, GuiClose

; Fire OptionChanged to Acquire Stick
Gosub, OptionChanged

; End Startup Sequence
Return

; When the GUI changes (or at the start, run this)
OptionChanged:
	Gui, Submit, NoHide 	; Pull VjoyID through from GUI
	; grab copy of helper object for this stick
	myStick := vJoyInterface.Devices[vJoyID]

	; Acquire the stick
	; Seeing as vJoyInterface.SingleStickMode defaults to 0, if another stick is already Acquired, it will be automatically Relinquished
	mystick.Acquire()

	; Update status of this stick in the GUI
	GuiControl, ,StickStatus, % myStick.GetStatusName()
	Return

; Hotkeys
F11::
	; Refer to the stick by name, move it to 0%
	myStick.SetAxisByName(0,"x")
	SoundBeep
	return

F12::
	; Refer to the stick by index (axis number), move it to 100% (32768)
	myStick.SetAxisByIndex(vJoyInterface.PercentTovJoy(100),1)
	SoundBeep
	return

; Quit when we exit the GUI
GuiClose:
	ExitApp
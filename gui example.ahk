#SingleInstance, force
#include <CvJoyInterface>

; Create an object from vJoy Interface Class.
vJoyInterface := new CvJoyInterface()

; Was vJoy installed and the DLL Loaded?
if (!vJoyInterface.vJoyEnabled()){
	; Show log of what happened
	Msgbox % vJoyInterface.LoadLibraryLog
	ExitApp
}

; Create The GUI
Gui, Add, Text, x70 y10, vJoy ID
Gui, Add, DropDownList, x130 yp-2 w50 vVJoyID gOptionChanged, 1||2|3|4|5|6|7|8|9|10|11|12|13|14|15|16
Gui, Add, Text, x70 y30, Status:
Gui, Add, Text, x130 yp vStickStatus w50 Center, 
Gui, Add, Edit, x5 yp+20 W240 R3 vDeviceCaps
Gui, Show, W250
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

	;vJoyInterface.GetVJDButtonNumber(vJoyID)
	out := "ID:`t" vJoyID " (" myStick.GetStatusName() ")`n"
	out .= "Buttons:`t" vJoyInterface.GetVJDButtonNumber(vJoyID) "`n"
	out .= "Axes:`t"
	Loop 8 {
		;AxisNames
		if (vJoyInterface.GetVJDAxisExist(vJoyID, vJoyInterface.AxisIndex[A_Index])){
			out .= vJoyInterface.AxisNames[A_Index] " "
		}
	}
	out .= "`n"
	GuiControl, ,DeviceCaps, % out

	; Update status of this stick in the GUI
	GuiControl, ,StickStatus, % myStick.GetStatusName()
	Return

; Hotkeys
F10::
	; On press of F10 try and press button 1
	myStick.SetBtn(1,1)
	Return

F10 up::
	; On release of F10, release button 1
	myStick.SetBtn(0,1)
	Return

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
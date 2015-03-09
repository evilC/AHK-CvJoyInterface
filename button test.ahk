; A test script to manipulate a vJoy stick so we can debug stick reading.

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

myStick := vJoyInterface.Devices[1]
key_down := 0

; End Startup Sequence
Return

; Hotkeys
F10::
	if (key_down){
		return
	}
	key_down := 1
	Loop 128 {
		myStick.SetBtn(1, A_Index)
	}
	SoundBeep
	; On press of F10 try and press button 1
	Return

F10 up::
	key_down := 0
	; On release of F10, release button 1
	Loop 128 {
		myStick.SetBtn(0, A_Index)
	}
	Return

F12::
	key_down := !key_down
	Loop 128 {
		myStick.SetBtn(key_down, A_Index)
	}
	SoundBeep
	; On press of F10 try and press button 1
	Return

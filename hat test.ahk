; Operate the 4 hats of a continuous POV vjoy stick
; Minimal error checking (Just check if DLL loaded), just the bare essentials code-wise.

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

; End Startup Sequence
Return

; Hotkeys
F9::
	; On press, move hat up
	myStick.SetContPov(0, 1)
	Return

F9 up::
	; On release, center hat
	myStick.SetContPov(-1, 1)
	Return

F10::
	; On press, move hat up
	myStick.SetContPov(0, 2)
	Return

F10 up::
	; On release, center hat
	myStick.SetContPov(-1, 2)
	Return

F11::
	; On press, move hat up
	myStick.SetContPov(0, 3)
	Return

F11 up::
	; On release, center hat
	myStick.SetContPov(-1, 3)
	Return

F12::
	; On press, move hat up
	myStick.SetContPov(0, 4)
	Return

F12 up::
	; On release, center hat
	myStick.SetContPov(-1, 4)
	Return


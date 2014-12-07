#SingleInstance, force
#include CvJoyInterface.ahk

; select which stick we are working with
vJoyID := 1

; Create an object from vJoy Interface Class.
vJoyInterface := new CvJoyInterface()

; Was vJoy installed and the DLL Loaded?
if (!vJoyInterface.vJoyEnabled()){
	; Show log of what happened
	Msgbox % vJoyInterface.LoadLibraryLog
	ExitApp
}

; The object vJoyInterface.Devices[<device number>] contains helper functions to make managing vjoy devices easier.
myStick := vJoyInterface.Devices[vJoyID]

; If using the helper functions, it will automatically try to Acquire, and fail silently (Optionally to debug)
;myStick.Acquire()
myStick.SetAxisByIndex(1,16384)

; Just for the fun of it, check if we actually have control of the stick

; Check the state of our stick
if (!myStick.IsAvailable()){
	msgbox % "Virtual Stick " vJoyID " is not available, status is: " myStick.GetStatusName()
	ExitApp
}

if (!myStick.IsOwned){
	msgbox % "Could not acquire stick id " vJoyID ".`nErrorLevel: " ErrorLevel
	ExitApp
}

Return

F11::
	; Refer to the stick by name, move it to the left
	myStick.SetAxisByName("x",0)
	SoundBeep
	return

F12::
	; Refer to the stick by index, move it to the right
	myStick.SetAxisByIndex(1,32767)
	SoundBeep
	return

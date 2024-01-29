AHK-CvJoyInterface
=================

A simple to use class for AutoHotkey to interface with [Shaul's vJoy](http://vjoystick.sourceforge.net) virtual joystick interface.  

Please make sure you use an up-to-date version of vJoy, it must be at least version [2.0.4 241214](http://sourceforge.net/projects/vjoystick/files/Beta%202.x/2.0.4%20241214/vJoy_204_241214.exe/download)

### What does it do?
It allows joystick **Output** from AutoHotkey to a virtual joystick (ie a stick that Windows thinks exists, but doesn't really).

**Please note:**  
vJoy **must be installed** for this library to work.

Example script included.

### Using this library in your projects
#### Setup
##### Easy Method
1. Clone this project using GitHub for Windows.
1. Run `Setup.exe`.  
This will check you are all set up to use the library and configure AutoHotkey so you can easily include the library in any script in any folder on your computer.
2. Check the *DEVELOPER NOTES* section to see if there are any special instructions, then click *Install*.
3. You are now set up and can use this library by putting the following line at the start of your script:  
`#include <CvJoyInterface>`

##### Manual Method
If you know what you are doing, or paranoid, or both, you can just obtain the files and `#include` as normal. The Setup app simply makes it easy for people who don't really know what they are doing to get up and running with this library.

#### Usage
Help on usage should be obtainable from the following sources (Best to Worst):

* Project [Wiki](https://github.com/evilC/AHK-CvJoyInterface/wiki)
* Example scripts.  
These usually illustrate basic set-up and usage.
* Library Source.  
May need to check this to see full list of features.


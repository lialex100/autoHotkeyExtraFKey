^a::
SplashTextOn, , ,  title , 
Sleep, 1000
SplashTextOff

^b::
#Persistent
ToolTip, Timed ToolTip`nThis will be displayed for 5 seconds.
SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
ToolTip
return


^d::
Progress, b w200, My SubText, My MainText, My Title
Progress, 1 ; Set the position of the bar to 50%.
Sleep, 4000
Progress, Off



^e::

#NoEnv
#SingleInstance Force
#NoTrayIcon
SetBatchLines -1
ListLines Off

msg =
paramnum := 2
Loop {
	IfGreater, paramnum, %0%
		Break
	msg .= %paramnum%
	IfLess, paramnum, %0%
		msg .= "`n"
	paramnum++
}

Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound
hwndmsg := WinExist()
WinSet, ExStyle, +0x20 ; WS_EX_TRANSPARENT make the window transparent-to-mouse
WinSet, Transparent, 160
Gui, Color, 202020 ;background color
Gui, Font, c5C5CF0 s17 wbold, Arial
;Gui, Add, Text, x20 y12, %1% ;title text from first arg
Gui, Add, Text ,, asdasdasd
Gui, Show

Sleep, 1000

Loop, 40 { ;fade out
	trnum := 160 - a_index*4
	WinSet, Transparent, %trnum%
	Sleep, 10
}
Gui, Destroy


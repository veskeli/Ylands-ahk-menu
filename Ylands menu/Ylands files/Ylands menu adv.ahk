;---------------------------------------------------------------------------------------------------------------------------------
;Ylands menu++ 0.111
;---------------------------------------------------------------------------------------------------------------------------------
;some stuff \/
#NoEnv  
SendMode Input  
SetWorkingDir %A_ScriptDir%  
toggle = 0
#MaxThreadsPerHotkey 2
#UseHook On
#SingleInstance force
#NoEnv
SetBatchLines, -1
CoordMode, Mouse, screen
CoordMode, Pixel, screen
Settingsini = %A_ScriptDir%\Settings\Settings.ini
picsfol = %A_ScriptDir%\pics


;ini read shit
IniRead, borderlesst , %Settingsini% , borderless
IniRead, ylandssimp , %Settingsini% , ylandsmenu


;---------------------------------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------------------------------
/*


Currently not updated



Menu keybindings
"Numpad -" button open menu 


"END" button close program
*/
;---------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------
FileRead, ylandsmenutext, %A_ScriptDir%\Settings\Text.txt
;---------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------
Loop
{
Process, Exist, Ylands.exe
{
 If errorlevel 0
{
  WinActivate, Ylands ahk_class UnityWndClass
;if errorlevel = 0 start menu=
MainGui(): 
{
	

if WinExist("Ylands")

WinGetPos,Xpos, YPos,WidthW,HeightH,Ylands
PosX := XPos+10, PosY := YPos +20
Gui -MaximizeBox -Caption +ToolWindow
Gui, show, x5 y5 w400 h150,

Menu Tray, Icon, shell32.dll, 308

Gui Add, Tab3, x0 y0 w1369 h741, Ylands menu++|Settings
Gui Tab, 1
Gui Add, GroupBox, x1064 y32 w300 h701, Hotkeys
Gui Add, Text, x1080 y56 w275 h671, %ylandsmenutext%
Gui Font, s20
Gui Add, Text, x424 y328 w192 h88 +0x200, Coming sooos
Gui Font
Gui Add, GroupBox, x816 y40 w232 h147, Auto smelter stuff
Gui Add, Radio, x832 y64 w120 h23 +Checked vironsmelt gSubmit, Iron
Gui Add, Radio, x832 y96 w120 h23 vcoppersmelt gSubmit, Copper
Gui Add, CheckBox, x824 y128 w78 h23 vsmeltesc gSubmit, Auto "Esc"
Gui Add, CheckBox, x912 y128 w91 h23 vsmeltmouse gSubmit, Auto mouse 2
Gui Add, CheckBox, x824 y160 w100 h23 vsmelttakeall gSubmit, Auto take all

Gui Tab, 2
Gui Font, s20
Gui Add, Button, x1243 y690 w117 h45 gsaveall, Save
Gui Font
Gui Add, GroupBox, x8 y32 w414 h356, Ylands menu++
Gui Add, GroupBox, x8 y392 w415 h341, Ylands menu
Gui Font, s20
Gui Add, Text, x104 y168 w192 h88 +0x200, Coming sooos
Gui Font
Gui Font, s20
Gui Add, Text, x112 y512 w192 h88 +0x200, Coming sooos
Gui Font
Gui Add, GroupBox, x424 y32 w558 h702, Overall
Gui Add, CheckBox, x440 y56 w189 h23 vylandsmenus gSubmit, Ylands menu(needs restart)
Gui Add, Text, x432 y704 w120 h23 +0x200, windowed borderless
Gui Add, Button, x552 y704 w80 h23 gborderlesstogg, Toggle
Gui Add, CheckBox, x720 y704 w120 h23 vautofullscrean gSubmit, Auto ON


Gui Show, x0 y0 w1367 h739, Ylands menu++ 

if (borderlesst == "borderless=1")
{
Sleep 150
goto borderlesstogg
}
	
}




;maingui end-----------------------
guishowmain := 0
;---------------------------------------------------------------------------------------------------------------------------------
NumpadSub::   ;numpad - open menu++
IfWinNotActive,MainGui
{
	KeyWait NumpadSub
	Gui Show, x0 y0 w1367 h739, Ylands menu++ 
	
	KeyWait NumpadSub, D
	WinActivate, Ylands ahk_class UnityWndClass
	MouseClick, right
}

return



Delete::  ;sulkee memun
ExitApp	
;---------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------
;keybindings=

+c::
;auto craft
Sleep 50
loop 20
{
MouseClick, left, 1550, 1015
sleep 50
}

return

+f::
WinActivate, Ylands ahk_class UnityWndClass
;Auto smelt thing


;iron smelt
if (ironsmelt == 1)
{
if (smeltmouse == 1)
{
MouseClick, right
sleep 150
}	
If (Smelttakeall == 1)
{
  Sleep 300
  MouseMove, 1735, 1044, 20
  loop 6
MouseClick, left, 1735, 1044
}

mouseclick, left, 400, 220
sleep 150
send iron ingot
sleep 150
MouseClick, left, 270, 300
sleep 150
loop 20
{
MouseClick, left, 1550, 1015
sleep 50
}
MouseClick, left, 860, 220


if (smeltesc == 1) 
{
Sleep 100
MouseClick, Left, 1870,20
}
}



;copper smelt
if (coppersmelt == 1)
{
if (smeltmouse == 1)
{
MouseClick, right
sleep 150
}	
If (Smelttakeall == 1)
{
sleep 300
MouseMove, 1735, 1044, 20
loop 6
MouseClick, left, 1735, 1044
}


mouseclick, left, 400, 220
sleep 150
send Copper ingot
sleep 150
MouseClick, left, 270, 300
sleep 150
loop 20
{
MouseClick, left, 1550, 1015
sleep 50
}
MouseClick, left, 860, 220



if (smeltesc == 1) 
{
Sleep 100
MouseClick, Left, 1870,20
}
}
return

+q::
;Q = Right click spammer
WinActivate, Ylands ahk_class UnityWndClass
Toggle := !Toggle
While Toggle{
Click right
sleep 50
}
return

+p::
;P = auto planter
WinActivate, Ylands ahk_class UnityWndClass
Toggle := !Toggle
While Toggle{
Click down
sleep 1200 
click up
sleep 100
}
return

NumpadDiv::
Suspend toggle
return

;---------------------------------------------------------------------------------------------------------------------------------
Submit:
Gui, Submit, Nohide
return
;---------------------------------------------------------------------------------------------------------------------------------
;save all
saveall:

IniWrite, %autofullscrean% , %settingsini%, borderless,borderless
IniWrite, %ylandsmenus% , %settingsini%, ylandsm, ylandsmenu
;IniWrite, %Update% ,%A_AppData%\%tekokansio%\%sovellusnumero%\%sovellusnumero%.ini,päivitys,päivitys



return
;---------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------
borderlesstogg:
WinActivate, Ylands ahk_class UnityWndClass
;WinSet, AlwaysOnTop, Toggle, A
WinGet, TempWindowID, ID, A
If (WindowID != TempWindowID)
{
  WindowID:=TempWindowID
  WindowState:=0
}
If (WindowState != 1)
{
  WinGetPos, WinPosX, WinPosY, WindowWidth, WindowHeight, ahk_id %WindowID%
  WinSet, Style, -0xC40000, ahk_id %WindowID%
  WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
  ;Hide Windows Task Bar and Start Button. (Remove the following two lines if you don't want that behaviour)
  ;WinHide ahk_class Shell_TrayWnd
  ;WinHide Start ahk_class Button
}
Else
{
  WinSet, Style, +0xC40000, ahk_id %WindowID%
  WinMove, ahk_id %WindowID%, , WinPosX, WinPosY, WindowWidth, WindowHeight
  ;Show the task bar again
  ;WinShow ahk_class Shell_TrayWnd
  ;WinShow Start ahk_class Button
}
WindowState:=!WindowState
return
;---------------------------------------------------------------------------------------------------------------------------------


}
;if errorlevel = ?? msgbox
MsgBox, 1, Error!, Ylands not running, 120
ExitApp
}
}
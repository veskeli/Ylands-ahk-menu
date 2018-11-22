;____________________________________________________________
;____________________________________________________________
;//////////////[Ylands menu 0.122]///////////////
currentversion := "0.122"
;____________________________________________________________
;____________________________________________________________
/*
Menu:

"Numpad -" Toggle ylands menu++
"Delete" Program exit
"Numpad /" Suspend keybindings (Toggle)
____________________________________________________________
____________________________________________________________
Mouse 2 spammer(toggle)
Auto planter
Auto run(Toggle)
Auto smelter filler(iron and copper)
Auto craft(Spam's craft button)
*/
;____________________________________________________________
;____________________________________________________________
;//////////////[Some stuff]///////////////
#Include %A_ScriptDir%\Actions\Autocraft.ahk
#Include %A_ScriptDir%\Actions\AutoPlanter.ahk
#Include %A_ScriptDir%\Actions\AutoSmelterFiller.ahk
#Include %A_ScriptDir%\Actions\Mouse2Spammer.ahk
#NoEnv  
#IfWinActive, ahk_class UnityWndClass ;Disables hotkeys when alt-tabbed or Ylands is closed.
#MaxThreadsPerHotkey 2
#UseHook On
#SingleInstance force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1
CoordMode, Mouse, screen
CoordMode, Pixel, screen
toggle = 0
Settingsini = %A_ScriptDir%\Settings\Settings.ini
picsfol = %A_ScriptDir%\pics
;____________________________________________________________
;____________________________________________________________
;//////////////[Read stuff]///////////////
IniRead, smeltesc1 , %Settingsini%, auto smelter shit, esc
IniRead, smeltmouse1 , %Settingsini%, auto smelter shit, mouse
FileRead, ylandsmenutext, %A_ScriptDir%\Settings\Text2.txt
;____________________________________________________________
;____________________________________________________________
;//////////////[Startup stuff]///////////////
if (smeltesc1 == 1)
{
smeltesc2 = Checked
}
if (smelttakeall1 == 1)
{
smelttakeall2 = Checked
}
if (smeltmouse1 == 1)
{
smeltmouse2 = Checked
}
;//////////////[Update]///////////////
/*
URLDownloadToFile, https://github.com/veskeli/Ylands-ahk-menu/raw/master/Update.txt , %A_ScriptDir%\Settings\Update.txt
FileReadline,Updatecheck , %A_ScriptDir%\Settings\Update.txt,2
if (Updatecheck == currentversion)
{
Goto updateskip
}
else
{
	MsgBox, 35, Update available, Update now?
	
ifMsgBox, Yes
Goto update
IfMsgBox, No
goto updateskip
IfMsgBox, Cancel
	FileDelete, %A_ScriptDir%\Settings\Update.txt
	Exitapp
}
update:
FileReadline,Updatelink , %A_ScriptDir%\Settings\Update.txt,3
IniWrite, %Updatelink% , %Settingsini%, Updatelink, update1
Run, %A_ScriptDir%\Auto update.ahk
FileDelete, %A_ScriptDir%\Settings\Update.txt
Exitapp
updateskip:
*/
;____________________________________________________________
;____________________________________________________________
;//////////////[Hotkey stuff]///////////////
;change if you want and know what you are doing
Mouse2Spammer := "+q"
AutoPlanter := "+p"
AutoSmelterFiller := "+f"
AutoCraft := "+c"
IronSmeltHotkey := "+1"
CopperSmeltHotkey := "+2"
OpenMenu := "NumpadSub"
SuspendHotkeys := "NumpadDiv"
;____________________________________________________________
; Do not touch:
Hotkey, %Mouse2Spammer%, Mouse2SpammerL
Hotkey, %AutoPlanter%, AutoPlanterL
Hotkey, %AutoSmelterFiller%, AutoSmelterFillerL
Hotkey, %AutoCraft%, AutoCraftL
Hotkey, %IronSmeltHotkey%, IronSmeltHotkeyL
Hotkey, %CopperSmeltHotkey%, CopperSmeltHotkeyL
Hotkey, %OpenMenu%, OpenMenuL
Hotkey, %SuspendHotkeys%, SuspendHotkeysL
;____________________________________________________________
;____________________________________________________________
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
;____________________________________________________________
;____________________________________________________________
;//////////////[gui]///////////////
Menu Tray, Icon, shell32.dll, 158

Gui -MaximizeBox -Caption +ToolWindow
Gui Add, Tab3, x0 y0 w507 h384, Ylands menu|Settings(not working currently)
Gui Tab, 1
Gui Font, s10
Gui Add, Text, x8 y24 w292 h357, %ylandsmenutext% 
Gui Font
Gui Add, GroupBox, x304 y24 w198 h161, Auto smelter filler settings
Gui Add, Radio, x312 y48 w120 h23  vironsmelt gSubmit, Iron
Gui Add, Radio, x312 y72 w120 h23  vcoppersmelt gSubmit, Copper
Gui Add, Radio, x312 y144 w130 h33 +Checked vautosmelt gSubmit, iron and copper fast hotkeys
Gui Add, CheckBox, x312 y96 w120 h23 %smeltesc2% vsmeltesc gSubmit, Auto "Esc"
Gui Add, CheckBox, x312 y120 w159 h23 %smeltmouse2% vsmeltmouse gSubmit, Auto mouse 2
Gui Add, Button, x416 y352 w80 h23 gsaveall, save
Gui Add, Button, x328 y352 w80 h23 gexitall, Exit
Gui Add, Button, x216 y352 w111 h23 gexitgameall, Exit Game and script
;____________________________________________________________
;____________________________________________________________
;//////////////[gui tab2]///////////////
Gui Tab, 2
Gui Add, CheckBox, vylandsmenus Checked gSubmit x8 y32 w284 h23, Ylands menu++ (more opshuns and more biggg menu)(uncheck)
Gui Add, Button, gsaveall2 x416 y352 w80 h23, Save

Gui Add, GroupBox, x8 y72 w221 h124, Delay settings (ms)
Gui Add, Edit, x16 y96 w74 h21 gSubmit	,	;Mouse 2 spammer (50)
Gui Add, Edit, x16 y120 w74 h21 gSubmit	,	;Smelter wait times (150) 
Gui Add, Edit, x16 y144 w74 h21	gSubmit ,	;Auto planter next wait(100)
Gui Add, Edit, x16 y168 w74 h21	gSubmit ,	;Auto Craft delay(50)
Gui Add, Text, x96 y96 w110 h20 +0x200, Mouse 2 spammer (50)
Gui Add, Text, x96 y120 w117 h20 +0x200, Smelter wait times (150) 
Gui Add, Text, x96 y144 w128 h20 +0x200, Auto planter next wait(100)
Gui Add, Text, x96 y168 w128 h20 +0x200, Auto Craft delay(50)

Gui Show, x0 y0 w505 h383, Ylands menu :D
Return
;End of gui
}
;____________________________________________________________
;____________________________________________________________
;//////////////[Exit Stuff]///////////////
exitgameall:
WinClose, ahk_class UnityWndClass ahk_exe Ylands.exe
	goto Exit2
exitall:
	goto Exit2
Delete::
	goto Exit2
GuiEscape:
GuiClose:
    goto Exit2
	
Exit2:
FileDelete, %A_ScriptDir%\Settings\Update.txt
ExitApp
;____________________________________________________________
;____________________________________________________________
;//////////////[Save all]///////////////
saveall:
IniWrite, %smeltesc% , %Settingsini%, auto smelter shit, esc
IniWrite, %smelttakeall% , %Settingsini%, auto smelter shit, take
IniWrite, %smeltmouse% , %Settingsini%, auto smelter shit, mouse
return
saveall2:
IniWrite, %ylandsmenus% , %settingsini%, ylandsm, ylandsmenu
return
;____________________________________________________________
;____________________________________________________________
;//////////////[smelt stuff]///////////////
IronSmeltHotkeyL:
IniWrite, iron , %Settingsini%, smelt,smell
return
CopperSmeltHotkeyL:
IniWrite, copper , %Settingsini%, smelt,smell
return
;____________________________________________________________
;____________________________________________________________
;//////////////[gui toggle]///////////////
OpenMenuL:   ;numpad - open menu
IfWinNotActive,MainGui
{
	KeyWait NumpadSub
	Gui Show, x0 y0 w505 h383, Ylands menu :D
	
	KeyWait NumpadSub, D
	WinActivate, Ylands ahk_class UnityWndClass
	MouseClick, right
}
return
;____________________________________________________________
;____________________________________________________________
;//////////////[submit]///////////////
Submit:
Gui, Submit, Nohide
return
;____________________________________________________________
;____________________________________________________________
;//////////////[autocraft]///////////////
AutoCraftL:
Autocraft()
return
;____________________________________________________________
;____________________________________________________________
;//////////////[auto smelt thing]///////////////
AutoSmelterFillerL:
WinActivate, Ylands ahk_class UnityWndClass
;//////////////[Iron smelt]///////////////
if (ironsmelt == 1)
{
;Open Smelter
if (smeltmouse == 1)
smeltmouseL()

;Iron smelt "AutoSmelterFiller.ahk"
ironsmelt()

;Exit smelter
if (smeltesc == 1) 
smeltescL()
return
}

;//////////////[Copper smelt]///////////////
if (coppersmelt == 1)
{
;Open smelter
if (smeltmouse == 1)
smeltmouseL()
	
coppersmelt()

;Exit smelter
if (smeltesc == 1) 
smeltescL()
return
}
IniRead, smlet, %Settingsini%, smelt
;//////////////[fast hotk smelt thing]///////////////
;//////////////[irun smlt]///////////////
if (smlet == "smell=iron")
{
;Open smelter
if (smeltmouse == 1)
smeltmouseL()	

ironsmelt()

;Exit smelter
if (smeltesc == 1) 
smeltescL()
}
;//////////////[copr smlt]///////////////
if (smlet == "smell=copper")
{
;Open smelter
if (smeltmouse == 1)
smeltmouseL()

coppersmelt()
;Exit smelter
if (smeltesc == 1) 
smeltescL()
}
return

;____________________________________________________________
;____________________________________________________________
;//////////////[right click spammer]///////////////
Mouse2SpammerL:
Mouse2Spammer()
return
;____________________________________________________________
;____________________________________________________________
;//////////////[Auto planter]///////////////
AutoPlanterL:
AutoPlanter()
return
;____________________________________________________________
;____________________________________________________________
;//////////////[Suspend]///////////////
SuspendHotkeysL:
Suspend toggle
return
;____________________________________________________________
;____________________________________________________________
;//////////////[End of menu, Do not remove]///////////////
} 
;____________________________________________________________
;____________________________________________________________
;//////////////[if errorlevel = ?? msgbox]///////////////
MsgBox, 1, Error!, Ylands not running, 120
FileDelete, %A_ScriptDir%\Settings\Update.txt
ExitApp
}
}
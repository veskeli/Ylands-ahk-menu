#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Settingsini = %A_ScriptDir%\Ylands files\Settings\Settings.ini
IniRead, ylandssimp , %Settingsini% , ylandsm


;currently i dont want adv version of the menu
/*
If (ylandssimp == "ylandsmenu=0")
{
Run, %A_ScriptDir%\Ylands files\Ylands menu adv.ahk
}
else
*/
Run, %A_ScriptDir%\Ylands files\Ylands menu simp.ahk

ExitApp
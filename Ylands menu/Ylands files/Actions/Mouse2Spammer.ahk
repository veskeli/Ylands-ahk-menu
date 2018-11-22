#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Mouse2Spammer()
{
WinActivate, Ylands ahk_class UnityWndClass
Toggle := !Toggle
While Toggle{
Click right
sleep 50
}
}
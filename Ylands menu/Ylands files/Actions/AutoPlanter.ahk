﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AutoPlanter()
{
WinActivate, Ylands ahk_class UnityWndClass
Toggle := !Toggle
While Toggle{
Click down
sleep 1200 
click up
sleep 100
}
}
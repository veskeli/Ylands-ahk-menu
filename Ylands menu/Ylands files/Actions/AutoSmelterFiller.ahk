#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

smeltmouseL()
{
MouseClick, right
sleep 150
}

smeltescL()
{
Sleep 100
MouseClick, Left, 1870,20
}

ironsmelt()
{
Sleep 300
MouseMove, 1735, 1044, 20
loop 6
MouseClick, left, 1735, 1044
sleep 50
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
}

coppersmelt()
{
Sleep 300
MouseMove, 1735, 1044, 20
loop 6
MouseClick, left, 1735, 1044
sleep 50
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
}
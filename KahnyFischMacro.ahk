#SingleInstance Force
if WinExist("Ahk_exe RobloxPlayerBeta.exe") {
    WinActivate
    WinRestore, A
    Sleep 250
    WinGetPos,,, W, H, A
    if (W >= A_ScreenWidth && H >= A_ScreenHeight) {
        Send, {F11}
        WinRestore, A
        Sleep 1525
    }
    WinMove, A,, 0, 0, 100, 100
}


; GO TO LINE 148 n 148 TO CHANGE 100 FOR A BIGGER NUMBER IF YOU SCRIPT IS JUST THROWING THE ROD ON THE WATER

;CLOSE THE TOGGLE QUEST, CHAT, AND LIST OF PLAYER

; GO TO LINE +70 TO CHANGE HOW MUCH "FORCE" U WILL USE AT THE ROD (when u are fishing, not when throwing)

; USE the prefix ";change ONLY the number" to see what number you can/should change

fail := 0
fail2 := 0
pos := 0
LastPos := 0
LOLP := 0
RCount := 0
Onee := 1

Loop 
{
if LOLP = 1 ; This is the main loop
{

Random rr, 29, 40
Random MouseSpeed, 2, 5

;434B5B a cor original, antes de ficar invertida pra fazer o ahk funfar

;MaxLeft 598, 595

PixelSearch, x, y, 227, 510, 599, 558, 0x434B5B,, Fast RGB
if (ErrorLevel = 0)
{
	
	if x < 359 ; LEFT = 1 ; 598 indicates where the script will see and say "ho, the pointer is on the left/right/middle" (this sound be on the BORDER of side you want, example: if you want the right side, take the locations of the pixels on the far LEFT of the RIGHT side, and same for the left side
	{
	pos := 1
	}

	if x > 359
	{
		if x < 450 ; MIDDLE = 2
		{
		pos := 2
		}
		else if x > 450 ; RIGHT = 3
		{
		pos := 3
		}
	}

Random NoCheat, 1, 5 


if (pos != LastPos)
{

ZZZ := 1

}

if pos = 1
{

LastPos := 1

}

if pos = 2
{

	if ZZZ = 1
	{

	ZZZ := 0

		if LastPos = 1
			{

			Send {LButton down}
			Sleep 501+NoCheat/8 ;change ONLY the number
			Send {LButton up}

			Sleep, 508+NoCheat/8 ;change ONLY the number (just a little bit, these guys must be close numbers)

			}

		if LastPos = 3
			{

			Send {LButton up}

			Onee := 1
			Sleep, 530+NoCheat ;change ONLY the number

			Send {LButton down}
			Sleep 529+NoCheat/2 ;change ONLY the number (just a little bit, these guys must be close numbers)
			Send {LButton up}

			Sleep, 10+NoCheat/4

			}

	} ; ZZZ = 1 pra executar isso só uma vez, essa parte ela vai botar na meiuca

Random StayOnMiddle, 117, 127 

; Essa parte tem que ficar loopando pra manter a barrinha no meio

	Send {LButton down}
	Sleep StayOnMiddle*1.41 ;change ONLY the number
	Send {LButton up}
	Sleep StayOnMiddle*1.3 ;change ONLY the number

	LastPos := 2

} ; pos 2 

if pos = 3
	{

		if Onee = 1
		{

		LastPos := 3
		Send {LButton down}
		Onee := 0

		}

	} ; Pos 3

} ; the end of the part 'find grey color'

	else if (ErrorLevel = 1)
	{
	
	fail := fail + 1

	PixelSearch, x, y, 109, 146, 719, 573, 0xFFFFFF,, Fast
		if (ErrorLevel = 0)
		{
		MouseMove, %x%, %y%, MouseSpeed
		Sleep rr*1.2
		Click	
		Sleep rr/7	
		Click
		Sleep 50+rr*1.3 ; Change this value "sleep 10" to something higher if you want the macro to click "Shake" slower.
		} ; If find the 'white' color
		else if (ErrorLevel = 1)
		{
		fail2 := fail2 + 1
		}
	} ; If cant find the 'grey' color

if fail > 100
{

	if fail2 > 100
	{

	Random UsingRod, 1100, 1037 ;change ONLY the number
	Send {LButton down}
	Sleep UsingRod
	Send {LButton up}
	
	fail2 := 0
	fail := 0

	Sleep UsingRod/3

	} ; FAIL2

} ;FAIL 1

} ; LOLP = 1

} ; Loop close

l::
MsgBox, ENDED
ExitApp
return

MButton::

if RCount = 0
{
LOLP := 1
Msg:= "ON"
MsgBox,,, % Msg, 0.3
Sleep, 1000
}

if RCount = 3
{
LOLP := 0
Msg:= "OFF"
MsgBox,,, % Msg, 0.3
}

RCount := RCount + 3

if RCount > 3
{
RCount := 0
}

return ;MButton return

x::
MsgBox, %fail% e %fail2%
return

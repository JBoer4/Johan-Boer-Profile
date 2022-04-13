#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



If WinExist("Character Editor Active.gba") and WinExist("dump - Notepad")
{
Numpad0::
	WinActivate Character Editor Active.gba
		send, {tab 6} ^c
		;gets unit name
	
	WinActivate dump - Notepad
		send, ^v =c(^s

	WinActivate Character Editor Active.gba
		send, {tab 8} ^c
		; get level and setup the loop format

	WinActivate dump - Notepad
		send, ^v^s

	; unit bases
	Loop, 8
	{
		WinActivate Character Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	WinActivate Character Editor Active.gba	
		send, {tab} ^c
		; Class is here of all places :(
	WinActivate dump - Notepad
		send, , "^v"^s
	; unit growths
	Loop, 7
	{
		WinActivate Character Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	send, ),{enter}^s

	WinActivate Character Editor Active.gba
		send, {tab 60}
		; get to next unit
	return
}





If WinExist("WinActivate Class Editor Active.gba") and WinExist("dump - Notepad"){
Numpad2::
	WinActivate Class Editor Active.gba
		send, {tab 6} ^c
		;gets class name
	
	WinActivate dump - Notepad
		send, ^v =c(^s

	WinActivate Class Editor Active.gba
		send, {tab 10} ^c
		; get hp and setup the loop format

	WinActivate dump - Notepad
		send, ^v^s

	; bases and max stats
	Loop, 8
	{
		WinActivate Class Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	WinActivate Class Editor Active.gba
		send, {tab}
	WinActivate dump - Notepad 
	Loop, 6
	{
		WinActivate Class Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}

	;promo gains
	WinActivate Class Editor Active.gba	
		send, {tab 10}
	WinActivate dump - Notepad
	
	Loop, 6	
	{
		WinActivate Class Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	
	WinActivate Class Editor Active.gba
		send, {tab 10} ^c
		;gets ability 1 which shows dancing thieving and whatnot - will have to decode later
	
	WinActivate dump - Notepad
		send, , ^v),{enter}^s

	WinActivate Class Editor Active.gba
		send, {tab 44}
	return
}



; for units with a skill
If WinExist("Character Editor Active.gba") and WinExist("dump - Notepad")
{
Numpad1::
	WinActivate Character Editor Active.gba
		send, {tab 6} ^c
		;gets unit name
	
	WinActivate dump - Notepad
		send, ^v =c(^s

	WinActivate Character Editor Active.gba
		send, {tab 9} ^c
		; get level and setup the loop format

	WinActivate dump - Notepad
		send, ^v^s

	; unit bases
	Loop, 8
	{
		WinActivate Character Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	WinActivate Character Editor Active.gba	
		send, {tab} ^c
		; Class is here of all places :(
	WinActivate dump - Notepad
		send, , "^v"^s
	; unit growths
	Loop, 7
	{
		WinActivate Character Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	send, ),{enter}^s

	WinActivate Character Editor Active.gba
		send, {tab 60}
		; get to next unit
	return
}


; for classes with a skill
If WinExist("WinActivate Class Editor Active.gba") and WinExist("dump - Notepad"){
Numpad3::
	WinActivate Class Editor Active.gba
		send, {tab 6} ^c
		;gets class name
	
	WinActivate dump - Notepad
		send, ^v =c(^s

	WinActivate Class Editor Active.gba
		send, {tab 11} ^c
		; get hp and setup the loop format

	WinActivate dump - Notepad
		send, ^v^s

	; bases and max stats
	Loop, 8
	{
		WinActivate Class Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	WinActivate Class Editor Active.gba
		send, {tab}
	WinActivate dump - Notepad 
	Loop, 6
	{
		WinActivate Class Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}

	;promo gains
	WinActivate Class Editor Active.gba	
		send, {tab 10}
	WinActivate dump - Notepad
	
	Loop, 6	
	{
		WinActivate Class Editor Active.gba
			send, {tab} ^c
		WinActivate dump - Notepad
			send, , ^v^s
	}
	
	WinActivate Class Editor Active.gba
		send, {tab 10} ^c
		;gets ability 1 which shows dancing thieving and whatnot - will have to decode later
	
	WinActivate dump - Notepad
		send, , ^v),{enter}^s

	WinActivate Class Editor Active.gba
		send, {tab 44}
	return
}
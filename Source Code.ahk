
ScreenWidth := A_ScreenWidth ; X
ScreenHeight := A_ScreenHeight ; Y


CenterX := ScreenWidth / 2 ;X
CenterY := ScreenHeight / 2 ;Y

E:: {
	While (GetKeyState("E", "P")) {
		SendInput ("W")
		Sleep (10)
	}
}

S:: {
	While (GetKeyState("S", "P")) {
		SendInput ("{Space}")
		Sleep (10)
	}
}

c:: {
	MouseMove CenterX, CenterY, 0
}

Numpad5:: {
	MouseMove CenterX, CenterY, 0
}


Left:: {
	MouseMove 0, CenterY, 0
}

Numpad4:: {
	MouseMove 0, CenterY, 0
}

Right:: {
	MouseMove ScreenWidth, CenterY, 0
}

Numpad6:: {
	MouseMove ScreenWidth, CenterY, 0
}

Up:: {
	MouseMove CenterX, 150, 0
}

Numpad8:: {
	MouseMove CenterX, 150, 0
}

Down:: {
	MouseMove CenterX, ScreenHeight, 0
}

Numpad2:: {
	MouseMove CenterX, ScreenHeight, 0
}

Numpad7:: {
	MouseMove 0, 0, 0
}

Numpad9:: {
	MouseMove ScreenWidth, 0, 0
}

Numpad1:: {
	MouseMove 0, ScreenHeight, 0
}

Numpad3:: {
	MouseMove ScreenWidth, ScreenHeight, 0
}

*r:: {
	show_mouse(1),KeyWait('r')
	SendInput('r')
}
*d:: {
	show_mouse(0),KeyWait('d')
	SendInput('d')
}

show_mouse(state) {
    static size := 5
    static color := 'Yellow'
    static goos := []
    
    if (!state) {
        if IsSet(goos) {
            for index, goo in goos
                goo.Destroy()
            ,goos := unset
        } return
    }
    
    if !IsSet(goos)
        goos := []
    
    CoordMode('Mouse', 'Screen')
    MouseGetPos(&mx, &my)
    goo := Gui('-Caption +ToolWindow +AlwaysOnTop +E0x20')
    goos.Push(goo)
    goo.BackColor := 0x1
    goo.AddProgress('x' mx-size ' y' my-size ' w' size*1.5 ' h' size*1.5 ' Background' color, 0)
    goo.Show('x0 y0 w1 h1 NoActivate')
    WinSetTransColor(0x1, 'ahk_id ' goo.hwnd)
    goo.Move(0, 0, A_ScreenWidth, A_ScreenHeight)
}

^!S::Exitapp
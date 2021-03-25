vk1C::vk1C
vk1D::vk1D

;一行目

vk1C & q::Send,{Blind}1
vk1C & w::Send,{Blind}2
vk1C & e::Send,{Blind}3
vk1C & r::Send,{Blind}4
vk1C & t::Send,{Blind}5
vk1C & y::Send,{Blind}6
vk1C & u::Send,{Blind}7
vk1C & i::Send,{Blind}8
vk1C & o::Send,{Blind}9
vk1C & p::Send,{Blind}0
vk1C & @::Send,{Blind}{BS}

vk1D & tab::AltTab
vk1D & q::Send,{Blind}{!}
vk1D & w::Send,{Blind}"
vk1D & e::Send,{Blind}{#}
vk1D & r::Send,{Blind}$
vk1D & t::Send,{Blind}{`%}
vk1D & y::Send,{Blind}&
vk1D & u::Send,{Blind}'
vk1D & i::Send,{Blind}(
vk1D & o::Send,{Blind})
vk1D & p::Send,{Blind}|
vk1D & @::Send,{Blind}{Del}

;2行目
vk1C & a::Send,{Blind}{home}
vk1C & s::Send,{Blind}{Esc}
vk1C & d::Send,{Blind}{Enter}
vk1C & f::Send,{Blind}{end}
vk1C & h::Send,{Blind}{left}
vk1C & j::Send,{Blind}{down}
vk1C & k::Send,{Blind}{up}
vk1C & l::Send,{Blind}{right}
vk1C & `;::Send,{Blind}{-}
vk1C & vkBA::Send,{Blind}{^}
vk1D & f::Send,#{r}

vk1D & h::Send,#{left}
vk1D & j::Send,#{down}
vk1D & k::Send,#{up}
vk1D & l::Send,#{right}
vk1D & `;::Send,{Blind}{=}
vk1D & vkBA::Send,{Blind}{~}

;3行目
vk1D & ,::Send,{Blind}{`{}
vk1D & .::Send,{Blind}{`}}
vk1D & /::Send,{Blind}{_}
vk1C & ,::Send,{Blind}{[}
vk1C & .::Send,{Blind}{]}
vk1C & /::Send,{Blind}{\}

vk1C & z::Send,{Blind}{F1}
vk1C & x::Send,{Blind}{F2}
vk1C & c::Send,{Blind}{F3}
vk1C & v::Send,{Blind}{F4}
vk1C & b::Send,{Blind}{F5}
vk1C & n::Send,{Blind}{F6}

vk1D & z::Send,{Blind}{F7}
vk1D & x::Send,{Blind}{F8}
vk1D & c::Send,{Blind}{F9}
vk1D & v::Send,{Blind}{F10}
vk1D & b::Send,{Blind}{F11}
vk1D & n::Send,{Blind}{F12}

*Space::
  SendInput {RShift Down}
  If SandS_SpaceDown = 1
  {
    Return
  }
  SandS_SpaceDown := 1
  SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
  SandS_AnyKeyPressed := 0
  ; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
  Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause} 
  SandS_AnyKeyPressed := 1
  Return

*Space Up:: 
  SendInput {RShift Up}
  SandS_SpaceDown := 0
  If SandS_AnyKeyPressed = 0
  {
    If A_TickCount - SandS_SpaceDownTime < 200
    {
      SendInput {Space}
    }
    ; Send EndKey of the "Input" command above
    ; You must use Send here since SendInput is ignored by "Input"
    Send {RShift}
  }
  Return

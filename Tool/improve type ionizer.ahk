msgbox Numpad Enter : next collumn    Numpad +: next location
num:=0	
Numpadenter::
if(num=0){
send V{tab}
}
else{
send s{tab}
}
num:=%num% +1
return

Numpadadd::
num:=0
send s{ESC}
send {TAB}
Send {ENTER}
send {tab}{tab}{tab}{tab}
return

!4::
ExitApp
return  
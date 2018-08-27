MButton::
PIDArr := []
ModelArr := []
pcb := 0
FileList =  ; Initialize to be blank.
Loop, D:\logfile\213\*.*
    {FileList = %FileList%%A_LoopFileName%`r`n
    	Loop, read, D:\logfile\211\%A_LoopFileName%
	{
    		Loop, parse, A_LoopReadLine, %A_Tab%
    		{	
			;msgbox, %A_LoopField%
			word_array := StrSplit(A_LoopField, ",") ; Omits periods.
			if( word_array [2] = "[RESULT]JLR.READ.NAD_VERSION") 
			{
				;msgbox, %A_LoopField%
				model := word_array[3]
				ModelArr [pcb] := word_array[3]
				PIDArr[pcb]  := A_LoopFileName
				pcb +=1
				send, %A_LoopFileName%
				send, {TAB}
				send, %model%
				send, {ENTER}
			}
    		}
	}
}

msgbox, %pcb%
FileSelectFile, FileName, S16,, Create a new file:
if (FileName = "")
	return
file := FileOpen(FileName, "w")
if !IsObject(file)
{
	MsgBox Can't open "%FileName%" for writing.
	return
}

file.Write(TestString)
file.Close()


Escape::
ExitApp
Return
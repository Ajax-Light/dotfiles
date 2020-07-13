; This is the default script executed when autohotkey is run. This changes with the executable name (i.e if AutoHotkey.exe is renamed to scipt.exe then the default 
; script will be script.ahk).

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2  ; Enables searching for Window Title even if the search string is a sub-string.

; Define the Window Group for Vim.
GroupAdd, Vim, ahk_class Vim
GroupAdd, Vim, ahk_class ConsoleWindowClass

; Directive to enable remap only in Vim windows, both in gvim and console vim.
#IfWinActive ahk_group Vim
+CapsLock::CapsLock  ; Shift+CapsLock triggers CapsLock.
CapsLock::Esc
#IfWinActive
return

; Ctrl+g opens google.com.
^g::
        Run https://www.google.com
return
" Vim syntax file
" Language: Unicon
" Maintainer:   Brian Tiffin (btiffin@gnu.org)
" URL: https://sourceforge.net/projects/unicon
" Last Change:  2016 Oct 22

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the Icon syntax to start with
runtime! syntax/icon.vim
unlet b:current_syntax

" Unicon function extensions
syn keyword uniconFunction Abort Active Alert Any Arb Arbno array
syn keyword uniconFunction Attrib Bak Bg Break Breakx chmod chown
syn keyword uniconFunction chroot classname Clip Clone cofail Color
syn keyword uniconFunction ColorValue condvar constructor CopyArea
syn keyword uniconFunction Couple crypt ctime dbcolumns dbdriver
syn keyword uniconFunction dbkeys dblimits dbproduct dbtables display
syn keyword uniconFunction DrawArc DrawCircle DrawCube DrawCurve
syn keyword uniconFunction DrawCylinder DrawDisk DrawImage DrawLine
syn keyword uniconFunction DrawPoint DrawPolygon DrawRectangle
syn keyword uniconFunction DrawSegment DrawSphere DrawString DrawTorus
syn keyword uniconFunction EraseArea Event eventmask EvGet EvSend
syn keyword uniconFunction exec Eye Fail fdup Fence fetch Fg fieldnames
syn keyword uniconFunction filepair FillArc FillCircle FillPolygon
syn keyword uniconFunction FillRectangle flock Font fork FreeColor
syn keyword uniconFunction FreeSpace getegid geteuid getgid getgr
syn keyword uniconFunction gethost getpgrp getpid getppid getpw
syn keyword uniconFunction getrusage getserv GetSpace gettimeofday
syn keyword uniconFunction getuid globalnames GotoRC GotoXY gtime
syn keyword uniconFunction IdentityMatrix InPort Int86 ioctl istate
syn keyword uniconFunction keyword kill Len link load localnames lock
syn keyword uniconFunction Lower MatrixMode max membernames methodnames
syn keyword uniconFunction methods min mkdir MultMatrix mutex name
syn keyword uniconFunction NewColor Normals NotAny opencl oprec OutPort
syn keyword uniconFunction PaletteChars PaletteColor PaletteKey
syn keyword uniconFunction paranames parent Pattern Peek Pending pipe
syn keyword uniconFunction Pixel PlayAudio Poke PopMatrix Pos proc
syn keyword uniconFunction PushMatrix PushRotate PushScale PushTranslate
syn keyword uniconFunction QueryPointer Raise ReadImage readlink ready
syn keyword uniconFunction receive Refresh Rem rmdir Rotate Rpos Rtab
syn keyword uniconFunction Scale select send setenv setgid setgrent
syn keyword uniconFunction sethostent setpgrp setpwent setservent setuid
syn keyword uniconFunction signal Span spawn sql stat staticnames
syn keyword uniconFunction StopAudio structure Succeed Swi symlink
syn keyword uniconFunction sys_errstr syswrite Tab Texcoord Texture
syn keyword uniconFunction TextWidth Translate trap truncate trylock
syn keyword uniconFunction umask Uncouple unlock utime wait
syn keyword uniconFunction WAttrib WDefault WFlush WinAssociate
syn keyword uniconFunction WinButton WinColorDialog WindowContents
syn keyword uniconFunction WinEditRegion WinFontDialog WinMenuBar
syn keyword uniconFunction WinOpenDialog WinPlayMedia WinSaveDialog
syn keyword uniconFunction WinScrollBar WinSelectDialog WriteImage
syn keyword uniconGraphics WSection WSync

" Unicon and Icon Graphic Keywords
syn match uniconKeyword "&col"
syn match uniconKeyword "&column"
syn match uniconKeyword "&control"
syn match uniconKeyword "&errno"
syn match uniconKeyword "&eventcode"
syn match uniconKeyword "&eventsource"
syn match uniconKeyword "&eventvalue"
syn match uniconKeyword "&interval"
syn match uniconKeyword "&ldrag"
syn match uniconKeyword "&lpress"
syn match uniconKeyword "&lrelease"
syn match uniconKeyword "&mdrag"
syn match uniconKeyword "&meta"
syn match uniconKeyword "&mpress"
syn match uniconKeyword "&mrelease"
syn match uniconKeyword "&pick"
syn match uniconKeyword "&now"
syn match uniconKeyword "&rdrag"
syn match uniconKeyword "&resize"
syn match uniconKeyword "&row"
syn match uniconKeyword "&rpress"
syn match uniconKeyword "&rrelease"
syn match uniconKeyword "&shift"
syn match uniconKeyword "&window"
syn match uniconKeyword "&x"
syn match uniconKeyword "&y"

" New reserved words
syn keyword uniconReserved critical import initially invocable method
syn keyword uniconReserved package thread 

" Storage class reserved words
syn keyword uniconStorageClass  abstract class

" Define the highlighting colour groups
hi def link uniconStorageClass  StorageClass
hi def link uniconFunction      Statement
hi def link uniconGraphics      Special
hi def link uniconReserved      Label
hi def link uniconKeyword       Operator

let b:current_syntax = "unicon"

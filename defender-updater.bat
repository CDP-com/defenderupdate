
::     D E F E N D E R - U P D A T E R

::   NEEDS testing on XP --   

::   Change the target in the shortcut
::	C:\Windows\System32\cmd.exe /K "C:\Users\%USERNAME%\Desktop\TESTING File SERVER (RW)\Alan\Defender-UPDATER.BAT"

::   Use this     "C:\Users\%USERNAME%\Desktop\TESTING File SERVER (RW)\Alan\Defender-UPDATER-currentUSER.LNK"
::   OR use this    file://C:\Users\alan\Downloads\1-app-Scripts\RUN-Defender-UPDATER.lnk


::   FOLDER for DESKTOP RW  [use RUN run]  "C:\Users\%USERNAME%\Desktop\TESTING File SERVER (RW)\Alan\
::   FOLDER CURRENT user	[use RUN run]  %windir%\explorer.exe C:\Users\%USERNAME%\Downloads\1-App-Scripts
::   FOLDER  ALAN			[use RUN run]  %windir%\explorer.exe C:\Users\Alan\Downloads\1-App-Scripts

ECHO off
setlocal
	set MpCmdRun="%ProgramFiles%\Microsoft Security Client\Antimalware\MpCmdRun.exe"
	set WD-UI="%ProgramFiles%\Microsoft Security Client\msseces.exe"
		if exist %MpCmdRun% goto :found
	set MpCmdRun="%ProgramFiles%\Microsoft Security Client\MpCmdRun.exe"
	set WD-UI="%ProgramFiles%\Microsoft Security Client\msseces.exe"
		if exist %MpCmdRun% goto :found
	set MpCmdRun="%ProgramFiles%\Windows Defender\MpCmdRun.exe"
	set WD-UI="%ProgramFiles%\Windows Defender\MSASCui.exe"
		if exist %MpCmdRun% goto :found
	goto :notfound
:found
	
	
	Echo . 
	Echo   After hitting a key, We WILL BE OPENING the APP to show updates needed
	Echo   WHEN done looking, AFTER you kit a key.... then CLOSE the APP, 
	Echo     -- THEN we will DO the UPDATE, and RE-open the app after update
	Echo .
	Echo    ?? WILL Security Essentials for Windows 7 show you need an update? OR,
	Echo    ?? WILL Windows Defender in Windows 8 show you need an update?
	Echo .
	Echo        ---  hit any key so we can OPEN the APP  ---   
	Echo   ---  DON'T forget to close the APP to continue when done looking  ---
	Echo   ---  This update WILL take a FEW MINUTES... so WATCH this window
	Echo .
PAUSE
%WD-UI%
	
	::%MpCmdRun% -?
%MpCmdRun% -SignatureUpdate -MMPC
	
	Echo .
	Echo       UPDATES DONE
	Echo   NOW we should show Security Essential's need for updates as gone, OR, 
	Echo   NOW we should show Windows Defender's need for updates as gone 
	Echo .
	Echo ---  we WILL use BITS when app is finished  --- this took 2 MB per Sec  ---
	Echo          ---  hit any key so we can OPEN the APP  ---
	Echo .
	PAUSE
%WD-UI%
	goto :endlocal
:notfound
	echo cannot find MpCmdRun.exe on your system
	echo find it yourself, then run it like this:
	echo MpCmdRun -SignatureUpdate -MMPC
:endlocal
	endlocal
GOTO :END
:END

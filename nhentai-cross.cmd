@echo off
CD >NUL

:: Applying nhentai-cross.reg ------------------------------------------- (1)

REGEDIT /S nhentai-cross.reg

del nhentai-cross.reg

:: Writing Uninstall strings to the Registry ----------------------- (2)

SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NHENTAI-CROSS

REG ADD %KEY% /v DisplayName /d "nhentai 0.0.9"

REG ADD %KEY% /v DisplayIcon /d "%SystemDrive%\Apps\nhentai-cross\assets\icon.ico"

REG ADD %KEY% /v UninstallString /d uninstall.cmd

REG ADD %KEY% /v DisplayVersion /d 0.0.9

REG ADD %KEY% /v Publisher /d "niuhuan"

REG ADD %KEY% /v URLInfoAbout /d https://github.com/niuhuan/nhentai-cross

REG ADD %KEY% /v HelpLink /d https://github.com/niuhuan/nhentai-cross

REG ADD %KEY% /v URLUpdateInfo /d https://github.com/niuhuan/nhentai-cross

REG ADD %KEY% /v NoModify /t REG_DWORD /d 1

REG ADD %KEY% /v NoRepair /t REG_DWORD /d 1

:: Creating uninstall.cmd ------------------------------------------- (3)

echo @echo off>%SystemRoot%\uninstall.cmd

echo CD>>%SystemRoot%\uninstall.cmd

echo :: Deleting BRU directory from Program Files>>%SystemRoot%\uninstall.cmd

echo RD /S /Q "%%SystemDrive%%\Apps\nhentai-cross">>%SystemRoot%\uninstall.cmd

echo :: Deleting BRU shortcut folder from Start Menu>>%SystemRoot%\uninstall.cmd

echo RD /S /Q "%%UserProfile%%\Start Menu\Programs\nhentai">>%SystemRoot%\uninstall.cmd

echo :: Deleting BRU reg tweaks from the Registry>>%SystemRoot%\uninstall.cmd

echo REG DELETE "HKCU\Software\niuhuan" /f>>%SystemRoot%\uninstall.cmd

echo :: Deleting BRU uninstall strings from the Registry>>%SystemRoot%\uninstall.cmd

echo REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\BRU /f>>%SystemRoot%\uninstall.cmd

echo :: Deleting uninstall.cmd (oh! that's me! OOPS!)>>%SystemRoot%\uninstall.cmd

echo del %%0>>%SystemRoot%\uninstall.cmd

:: Deleting nhentai-cross.cmd (oh! that's me! OOPS!) -------------------- (4)

del %0

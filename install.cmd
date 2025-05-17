@echo off
CD >NUL

:: Applying nhentai-cross.reg ------------------------------------------- (1)

REGEDIT /S install.reg

del nhentai-cross.reg

:: Writing Uninstall strings to the Registry ----------------------- (2)

SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NHENTAI-CROSS

REG ADD %KEY% /v DisplayName /d "NHENTAI-CROSS"

REG ADD %KEY% /v DisplayIcon /d "%SystemDrive%\Apps\nhentai\assets\icon.ico"

REG ADD %KEY% /v UninstallString /d "%SystemDrive%\Apps\nhentai\uninstall.cmd"

REG ADD %KEY% /v DisplayVersion /d 0.0.9

REG ADD %KEY% /v Publisher /d "niuhuan"

REG ADD %KEY% /v URLInfoAbout /d https://github.com/niuhuan/nhentai-cross

REG ADD %KEY% /v HelpLink /d https://github.com/niuhuan/nhentai-cross

REG ADD %KEY% /v URLUpdateInfo /d https://github.com/niuhuan/nhentai-cross

REG ADD %KEY% /v NoModify /t REG_DWORD /d 1

REG ADD %KEY% /v NoRepair /t REG_DWORD /d 1

:: Creating uninstall.cmd ------------------------------------------- (3)

echo @echo off>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo CD>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo :: Deleting NHENTAI-CROSS directory>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo RD /S /Q "%%SystemDrive%%\Apps\nhentai">>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo :: Deleting NHENTAI-CROSS shortcut folder>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo RD /S /Q "%%UserProfile%%\Start Menu\Programs\Apps\NHENTAI-CROSS">>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo :: Deleting NHENTAI-CROSS registry settings>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo REG DELETE "HKCU\Software\niuhuan" /f>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo :: Deleting NHENTAI-CROSS uninstall strings>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NHENTAI-CROSS /f>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo :: Deleting uninstall.cmd>>%SystemDrive%\Apps\nhentai\uninstall.cmd

echo del %%0>>%SystemDrive%\Apps\nhentai\uninstall.cmd

:: Deleting nhentai-cross.cmd -------------------- (4)

del %0

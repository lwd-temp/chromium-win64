@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

copy /Y src\out\stable-sync-x64\mini_installer.exe ..\out\x64\mini_installer.sync.exe
copy /Y src\out\stable-sync-x64\chrome.7z ..\out\x64\chrome.sync.7z
copy /Y src\out\stable-nosync-x64\mini_installer.exe ..\out\x64\mini_installer.nosync.exe
copy /Y src\out\stable-nosync-x64\chrome.7z ..\out\x64\chrome.nosync.7z

cmd /c "wsl (rm ../out/noarch/policy_templates.zip; cd src/out/stable-undefined-noarch/gen/chrome/app/policy; zip -qrX1 ../../../../../../../../out/noarch/policy_templates.zip .)"
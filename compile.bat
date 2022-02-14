rd /s /q C:\Staging\MirUpakovki2\
%windir%\Microsoft.NET\Framework64\v4.0.30319\aspnet_compiler -p "C:\dev\MirUpakovki2\Web" -v / C:\Staging\MirUpakovki2 -u -fixednames
erase C:\Staging\MirUpakovki2\*.bat
erase C:\Staging\MirUpakovki2\bin\*.pdb
"%ProgramFiles(x86)%\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.1 Tools\aspnet_merge.exe" C:\Staging\MirUpakovki2 -a -w MirUpakovki2Web.dll
erase C:\Staging\MirUpakovki2\web.config
erase C:\Staging\MirUpakovki2\errors.html
rd /s /q C:\Staging\MirUpakovki2\i\
rd /s /q C:\Staging\MirUpakovki2\fckeditor\
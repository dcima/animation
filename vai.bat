echo "Spostamento foto nella cartella c:\scarica\foto"
powershell Set-ExecutionPolicy RemoteSigned -scope currentuser
powershell.exe "& '%~dp0scaricaFoto.ps1' -phoneName 'L31' -sourceFolder 'External Memory\DCIM\100NIKON' -targetFolder 'C:\scarica\foto' -filter '(.jpg)|(.mp4)$'"

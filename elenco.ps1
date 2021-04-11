echo "Monto disco di rete"
New-PSDrive -Name "H" -PSProvider "FileSystem" -Root "\\2.37.211.21\H"
echo "Selezione cartella destinazione foto"
$annoCorrente = get-date -Format yyyy
$percorsoBase = "H:\Vig\Foto\ANNO $annoCorrente"
$dir = Get-ChildItem -Path $percorsoBase -Name
$dir
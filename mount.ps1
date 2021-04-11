#New-PSDrive -Name "H" -PSProvider "FileSystem" -Root "\\2.37.211.21\H"

Write-Output "Variabili globali"
$annoCorrente = ""
$percorsoBase = ""


Write-Output "Connessione al server"
If (-not (Test-Path -Path "H:\")) {
	(new-object -com WScript.Network).MapNetworkDrive("H:", "\\2.37.211.21\H")
}

Write-Output "Impostazioni variabili globali"
$annoCorrente = get-date -Format yyyy
$percorsoBase = "H:\Vig\Foto\ANNO $annoCorrente"
$elenco = Get-ChildItem -Path $percorsoBase -Name

Write-Output "Costruzione form data entry"
Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Selezione cartella di destinazione'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true

$lblElenco = New-Object System.Windows.Forms.Label
$lblElenco.Text = "Seleziona dall'elenco qui sotto la cartella principale"
$lblElenco.Location = New-Object System.Drawing.Point(0, 10)
$lblElenco.AutoSize = $true
$main_form.Controls.Add($lblElenco)

$combo1 = New-Object System.Windows.Forms.ComboBox
$combo1.Width = 300
Foreach ($dir in $elenco) {
	$combo1.Items.Add($dir);
}
$combo1.Location = New-Object System.Drawing.Point(100, 20)
$main_form.Controls.Add($combo1)

$lblCognome = New-Object System.Windows.Forms.Label
$lblCognome.Text = "Il tuo cognome:"
$lblCognome.Location = New-Object System.Drawing.Point(200, 40)
$lblCognome.AutoSize = $true
$main_form.Controls.Add($lblCognome)

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = ""
$Label3.Location = New-Object System.Drawing.Point(300, 40)
$Label3.AutoSize = $true
$main_form.Controls.Add($Label3)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(400, 10)
$Button.Size = New-Object System.Drawing.Size(500, 23)
$Button.Text = "Check"
$main_form.Controls.Add($Button)

$Button.Add_Click( {
		$Label3.Text = [datetime]::FromFileTime((Get-ADUser -identity $ComboBox.selectedItem -Properties pwdLastSet).pwdLastSet).ToString('MM dd yy : hh ss')
	})

$main_form.ShowDialog()
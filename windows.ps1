[System.Reflection.Assembly]::LoadWithPartialName("PresentationFramework") | Out-Null

function Import-Xaml {
    [xml]$xaml = Get-Content -Path $PSScriptRoot\window.xaml
    $manager = New-Object Sytem.Xml.XmlNamespaceManager -ArgumentList $xaml.NameTable
    $manager.AddNamespace("x", "http://schemas.microsoft.com/winfx/xaml")
    $xamlReader = New-Object System.Xml.XmlNodeReader $xaml
    [Windows.Markup.XmlReader]::Load($xamlReader)
}

$window = Import-Xaml
$window.ShowDialog()

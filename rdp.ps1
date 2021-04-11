echo "Connessione al server CPGEV-Zanardi"
$Server="2.37.211.21"
$User="Master\operatore"
$Password="lr231989"

cmdkey /delete:$Server 
cmdkey /add:$Server /user:$User /pass:$Password
mstsc .\ZanardiOperatore.rdp /admin /control  /v:$Server

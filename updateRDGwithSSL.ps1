<#

	4/10/2020
	1) Use Certify to automatically update your "Default Web Site" in IIS
	2) Enable Advanced Options 
	3) Click Scripting
	4) Add this script to the "Post-Request PS Script"

#>


param($result)

set-alias ps64 "$env:C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe"

ps64 -args $result -command {

	$result = $args[0]

	# Gets Certificate Hash of the certificate generated by Certify
	$hash = $result.ManagedItem.CertificateThumbprintHash

	# This is a different module than "RemoteDesktop".
	# This mounts an RDS PS-Drive, and allows us to modify the thumbprint element.
	Import-Module RemoteDesktopServices

	# Sets the RDG Certificate thumbprint to the cert specified above.
	set-item -Path "RDS:\GatewayServer\SSLCertificate\Thumbprint" $hash

	# Restarts RDG Service
	Restart-Service -Name TSGateway

}

<#

	If this is on an actual Remote Desktop Services desployment with a broker, do this
	
	#Import-Module RemoteDesktop
	#Set-RDCertificate -Role RDPublishing -ImportPath $pfxpath -Force
	#Set-RDCertificate -Role RDWebAcces -ImportPath $pfxpath -Force
	#Set-RDCertificate -Role RDGateway -ImportPath $pfxpath -Force
	#Set-RDCertificate -Role RDRedirector -ImportPath $pfxpath -Force
	
	#Restart-Service -Name TSGateway
#>
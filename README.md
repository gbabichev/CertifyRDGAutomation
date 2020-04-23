# CertifyRDGAutomation
Automates Certificate Renewal in Remote Desktop Gateway using Certify

When you configure a Remote Desktop Environment, typically the deployment consists of:
- Remote Desktop Gateway
- Remote Desktop Broker
- Remote Desktop Licensing
- Remote Desktop Session Host

When configuring in this "Default configuration" using a Broker, a plethora of management options open up, and you can do a lot of things using PowerShell.

BUT! If you just configured a Remote Desktop Gateway, to access computers inside of an organization, or at home, then you don't get any of these PowerShell commandlets, which really hampers automation.

Luckily, there exists a way to update SSL Certificates using PowerShell even if you don't have an RD Broker. 

1) Downlaod the script from the Releases.
2) Open up Certify, and select your "Default Web Site" IIS site. 
3) Check the box for "Advanced Options"
4) Click Scripting
5) Add this script to the "Post-Request" section. 



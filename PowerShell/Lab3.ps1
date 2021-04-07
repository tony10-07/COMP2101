Get-CimInstance Win32_NetworkAdapterConfiguration | 
Where-Object IPEnabled -EQ True |
Select-Object @{n="Adapter Description";e={$_.Description}},
              Index,
              IPAddress,
              @{n="Subnet Mask";e={$_.IPSubnet}},
              @{n="DNS Domain Name";e={$_.DNSHostname}},
              @{n="DNS Server";e={$_.DNSServerSearchOrder}} | 
Format-Table
echo Starting Triage Process... > triage.txt
echo ---------------------------------------- >> triage.txt
echo. >> triage.txt

::checking time information::
echo The suspect system time is: >> triage.txt
echo Date: %date% Time: %time% >> triage.txt
echo. >> triage.txt
echo According to NTP server time.windows.com, the current time is: >> triage.txt
w32tm /stripchart /computer:time.windows.com /dataonly /samples:1 >> triage.txt
echo ---------------------------------------- >> triage.txt
echo. >> triage.txt

::Gathering System Information::
echo --- SYSTEM INFORMATION --- >> triage.txt
echo See systeminfo.txt for details >> triage.txt
systeminfo > systeminfo.txt
echo. >> triage.txt

::Gathering Environment Variables::
echo --- Environment Variables --- >> triage.txt
set >> triage.txt
echo. >> triage.txt

::User Accounts Information::
echo --- USER ACCOUNTS --- >> triage.txt
echo Running "wmic useraccount" to gather user account information and saving to a separate CSV file... >> triage.txt
wmic useraccount >> useraccounts.csv
echo. >> triage.txt
echo Listing the contents of the C:\Users directory... >> triage.txt
echo ========================================================= >> triage.txt
dir C:\Users >> triage.txt
echo. >> triage.txt

::Running Processess and Services::
echo --- RUNNING PROCESSES --- >> triage.txt
tasklist >> triage.txt
echo. >> triage.txt
echo --- RUNNING SERVICES --- >> triage.txt
echo Saving running services to services.txt... >> triage.txt
sc query > services.txt
echo. >> triage.txt

::Networking::
echo --- NETWORK INFORMATION --- >> triage.txt
echo IP Configuration: >> triage.txt
ipconfig /all >> triage.txt
echo. >> triage.txt
echo Active Network Connections: >> triage.txt
netstat -ano >> triage.txt
echo. >> triage.txt
echo ARP Cache: >> triage.txt
arp -a >> triage.txt
echo. >> triage.txt
echo Routing Table: >> triage.txt
route print >> triage.txt
echo. >> triage.txt
echo DNS Cache: >> triage.txt
ipconfig /displaydns >> triage.txt
echo. >> triage.txt
echo Hosts File Content: >> triage.txt
type C:\Windows\System32\drivers\etc\hosts >> triage.txt
echo. >> triage.txt
echo Windows Firewall Status: >> triage.txt
netsh advfirewall show allprofiles >> triage.txt
echo. >> triage.txt

::Persistence and Startup Items::
echo --- PERSISTENCE AND STARTUP ITEMS --- >> triage.txt
echo Saving scheduled tasks to scheduledtasks.txt... >> triage.txt
schtasks /query /fo LIST /v > scheduledtasks.txt
echo. >> triage.txt
echo Saving Registry autostart information from HKLM\Software\Microsoft\Windows\CurrentVersion\Run and HKCU\Software\Microsoft\Windows\CurrentVersion\Run in separate files... >> triage.txt
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" > HKLM_Run.txt
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" > HKCU_Run.txt
echo. >> triage.txt
echo Listing contents of common startup folders... >> triage.txt
echo Listing "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"... >> triage.txt
dir "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" >> triage.txt
echo. >> triage.txt
echo Listing "%APPDATA%\Microsoft\Windows\Start Menu\Programs\StartUp"... >> triage.txt
dir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\StartUp" >> triage.txt
echo. >> triage.txt

::Devices and Storage::
::teammates write your code here
wmic diskdrive get caption,deviceid,mediatype,size,status
wmic logicaldisk get name,description,filesystem,size,freespace 
wmic path CIM_USBDevice
pnputil /enum-devices /connected


::Logs & event traces::
::teammates write your code here. I also suggest saving logs to a separate file instead of the triage.txt file because log files can be very long.

::Current USB Device connections::
echo --- USB DEVICE INFORMATION --- >> triage.txt
wmic path Win32_PnPEntity where "DeviceID like 'USB%%'" get Name,DeviceID > connectedusbdevices.txt
echo. >> triage.txt

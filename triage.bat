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


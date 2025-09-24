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
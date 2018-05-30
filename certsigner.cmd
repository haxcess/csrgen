:: Iterate through local directory looking for csr*.pem and submit it to domain signing appliance
@echo off

:: Replace template, CA details with real data
FOR /R .\ %%G IN (*.csr) DO (
   cd %%~dpG
      echo Generating %%~nG
      certreq -attrib "CertificateTemplate:webserver" -submit -config ca.example.com\ISSUE-CA1 %%~nxG  %%~nG.crt chain-%%~nG.crt full-%%~nG.crt
)
cd ..
@echo done

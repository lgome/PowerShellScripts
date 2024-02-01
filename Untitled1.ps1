cd C:\CFBinkyServer\jboss-4.2.3.GA\server\default\logs

Select-String -Path cf.log -Pattern 'Caused by: java.lang.OutOfMemoryError: Java heap space'




$myTeamsWebHook = “https://aligntech.webhook.office.com/webhookb2/db5e9c91-c821-40ed-be14-5d694200a8c1@9ac44c96-980a-481b-ae23-d8f56b82c605/IncomingWebhook/996531355de046308bfcf13b2016fdd1/4625e6b7-da91-44a1-b27a-9257fd279167”
Invoke-RestMethod -Method post -ContentType 'Application/Json' -Body '{"text":"Test Teams!"}' -Uri $myTeamsWebHook
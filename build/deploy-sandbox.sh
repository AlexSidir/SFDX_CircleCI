#Convert to MDAPI format for deployment to prod
echo "Converting to MDAPI format..."
sfdx force:source:convert -d deploy_sandbox -r force-app 
#Deploy to sandbox for validation (without deploying changes)  & run all tests
echo "Deploying to sandbox & running all tests..."
sfdx force:mdapi:deploy -u Dev -d deploy_sandbox/ -w -1 -l RunAllTestsInOrg --checkonly
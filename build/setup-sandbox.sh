# Get the private key from the environment variable
echo "Setting up Sandbox Connection..."
#mkdir keys
#echo $SFDC_SERVER_KEY | base64 -d > keys/server.key
openssl enc -nosalt -aes-256-cbc -d -in assets/devalex_server.key.enc -out assets/devalex_server.key -base64 -K $DECRYPTION_KEY -iv $DECRYPTION_IV

# Authenticate to salesforce
echo "Authenticating..."
#sfdx force:auth:jwt:grant --clientid $SFDC_PROD_CLIENTID --jwtkeyfile keys/server.key --username $SFDC_PROD_USER --setdefaultdevhubusername -a DevHub
sfdx force:auth:jwt:grant --clientid $SFDC_BUILDDEV_CLIENTID --jwtkeyfile assets/devalex_server.key --username $SFDC_BUILDDEV_USER -r https://test.salesforce.com/ --setdefaultdevhubusername -a Dev

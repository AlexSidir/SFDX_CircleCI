# Get the private key from the environment variable
echo "Setting up DevHub Connection..."
#mkdir keys
#echo $SFDC_PROD_SERVER_KEY | base64 -d > keys/server.key
openssl enc -nosalt -aes-256-cbc -d -in assets/prod_server.key.enc -out assets/prod_server.key -base64 -K $DECRYPTION_KEY_PROD -iv $DECRYPTION_IV_PROD

# Authenticate to salesforce
echo "Authenticating..."
#sfdx force:auth:jwt:grant --clientid $SFDC_PROD_CLIENTID --jwtkeyfile keys/server.key --username $SFDC_PROD_USER --setdefaultdevhubusername -a DevHub
sfdx force:auth:jwt:grant --clientid $SFDC_PROD_CLIENTID --jwtkeyfile assets/prod_server.key --username $SFDC_PROD_USER --setdefaultdevhubusername -a Dev

#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s 
sfdx force:user:password:generate -u ${CIRCLE_BRANCH}
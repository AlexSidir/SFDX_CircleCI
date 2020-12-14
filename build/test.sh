sfdx force:source:push -u ${CIRCLE_BRANCH} --json
sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername ${CIRCLE_BRANCH}

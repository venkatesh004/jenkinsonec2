Terraform Apply

Access Jenkins with Public IP - http://<public-ip>:8080/

Login to EC2 instance and copy the initial password from 
/var/lib/jenkins/secrets/initialAdminPassword

Install Plugins
Create new user name and password

Create Multi-Branch Pipeline Project

In Branch Source, configure the Git Repo choosing Git:
git@github.com:nikidevops/DotNet-nopCommerce.git

Add Credential with Kind as SSH Username with private key
Use the user name and the private key you copied to the instance

Save the Project

Update the credential id in the Jenkinsfile
https://github.com/nikidevops/DotNet-nopCommerce/blob/master/Jenkinsfile

# You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.

Update Host Key Verification Strategy

Copy the public key to the Git Repo
Settings -> SSH and GPC Keys -> New SSH Key

Click -> Scan MultiBranch Pipeline Now

Install Plugin withAWS 
Manage Jenkins -> Install Plugins -> Available Plugins 
    -> AWS Credentials
    -> Pipeline: AWS StepsVersion

Add the AWS Credentials and update the same in Jenkinsfile
Manage Jenkins -> Credentials -> System -> Global credentials (unrestricted)
Kind as AWS Credentials -> Copy Access Key ID and Secret Access Key


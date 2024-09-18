GITHUB ACTIONS WITH DOCKER, EC2 AND TERRAFORM
Open aws cli
Connect the ec2 instance to ssh
	ssh -i </path/to/your-key.pem> <user-name>@<your-instance-public-ip>
	Replace path
	Replace user
	Amazon Linux: ec2-user
Ubuntu: ubuntu
Replace public ip
Check docker version #obviously docker is not installed
Update sudo apt-get update 
Install docker sudo apt install docker -y
Start the service of docker sudo service docker start
On the docker sudo chkconfig docker on
Check docker version docker --version
Add user to docker group sudo usermod -aG docker $USER replace user with necessary user name either ubuntu or ec2-user according to the type of instance you created.
For the changes to take effect newgrp docker
ls -l /var/run/docker.sock for this command output should look like this srw-rw---- 1 root docker 0 Sep 12 05:57 /var/run/docker.sock
sudo systemctl restart docker
Next thing is to change security group,go to ec2 instance and go to security rules and see if the inbound rules contains the port 80 or not.If it doesn't contain port 80 do the following
Go to ec2 and click on security groups under network and security
Grab the value of security group id in ec2 instance.make sure it start with sg not sgr
	
Now search the sg id and Go to inbound rules click on edit and add a new rule with the following
	type=http,protocol=tcp,port=80,source=0.0.0.0/0
Aws work is done for now

Update secret variables:
The secrets we need to create here and their values are as follows:
DOCKER_USERNAME: .......
DOCKER_PASSWORD: .......
EC2_HOST: ec2-18-205-57-167.compute-1.amazonaws.com
EC2_PRIVATE_KEY:you have created a pem file during instance creation.that is the private key here.
EC2_USERNAME:ec2-user or ubuntu according to the ami of instance.
	AWS_ACCESS_KEY_ID : IAM user access key id
	AWS_SECRET_ACCESS_KEY : IAM user secret access key


Result
Now the last thing is to check output.
You should see the output in two urls. They are
Public IPv4 DNS
Ex : http://ec2-........compute-1.amazonaws.com/

Port no 80
http://<EC2_PUBLIC_IP>:<PORT>
	http://.......:80
Reference:
https://youtu.be/OjRevvZvWX4?si=b_pgseA98qO3yabN





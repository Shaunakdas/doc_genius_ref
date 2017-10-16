## Connecting to remote
### Setting up ssh ([Ref](http://www.clovescarneirojr.com/2016/02/10/deploy-rails-app-to-aws-vpc-ec2-rds-elb.html))
Locate your private key file (*.pem) and paste it into ~/.ssh folder

Add following entry to ~/.ssh/config to make connecting to the instance easier.
```
Host wrapper_prod_m4
HostName 18.220.154.238
User ubuntu
IdentityFile "~/.ssh/<YOUR KEY>.pem"
```
With this in place, you can just ```ssh wrapper_prod_m4``` to connect to your EC2 instance.
### Copying local ssh key to remote to deploy ([Ref](https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma))
If you don't have a SSH Key for your local computer, create one for it as well. In your local terminal session:
```
ssh-keygen -t rsa 
```
Add your local SSH Key to your Droplet's Authorized Keys file (remember to replace the port number with your customized port number):
```
cat ~/.ssh/id_rsa.pub | ssh -p 22 ubuntu@wrapper_prod_m4 'cat >> ~/.ssh/authorized_keys'
```
## Deploying to remote
Okay, we’re almost done with the server. Go back to your local machine to start deployment with Capistrano. Edit the ```config/deploy/production.rb``` to set the server IP. Open the file and paste the following into the file. Change the host to match with your server’s IP:
```
server 'wrapper_prod_m4', user: 'ubuntu', roles: %w{web app db}
```
Now let’s start the deployment using Capistrano:
```
cap production deploy
```

### Stuff used to make this:

 * [Deploy Rails in AWS](https://www.sitepoint.com/deploy-your-rails-app-to-aws/) Installing Rails in remote Ubuntu from scratch adn deploying
 * [Rspec Tutorial](https://www.sitepoint.com/learn-the-first-best-practices-for-rails-and-rspec/) for Best Practices for Rails and RSpec
 * [JWT Tutorial](https://www.sitepoint.com/authenticate-your-rails-api-with-jwt-from-scratch/) for managing authentication with jwt in rails
 * [Discourse API docs](http://docs.discourse.org/)
 * [Faraday gem](https://github.com/lostisland/faraday) for handling API calls to external hosts
 * [Figaro Gem](https://github.com/laserlemon/figaro) For handling environment variables

## Reading production.log
In order to read production logs.  Change the host to match with your server’s IP:
```
ssh wrapper_prod_m4
```
After login into server's IP, read production log by following:-
```
vi /home/ubuntu/connecpath_be/current/log/production.log
```
Displays only the last 100 lines
```
tail -n 100 -F /home/ubuntu/connecpath_be/current/log/production.log
```
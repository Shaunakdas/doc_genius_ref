## Local(Mac)

### Setting Up Postgres User ([Ref](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04))
```
psql
```
Once you are inside psql terminal, create user.
```
create user shaunakdas2020;
ALTER USER shaunakdas2020 CREATEDB;
```

### Installing Ruby([Ref](https://gorails.com/setup/osx/10.12-sierra))
We're going to use rbenv to install and manage our Ruby versions.
To do this, run the following commands in your Terminal:
```
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
```

Check whether rails of version 5.1.3 is installed by running this command.

### Installing Rails

```
gem install rails -v 5.1.3 -V --no-ri --no-rdoc
gem install bundler -V --no-ri --no-rdoc
```
Check whether rails of version 5.1.3 is installed by running this command.
```
rails -v
```
### Copying the directory
Inside your workspace, clone the current repository by running this command.
```
git clone https://github.com/indiez/connecpath-be.git
cd connecpath-be
```

### Installing necessary libraries
Inside the directory run the folling command. It will pickup the directory definitions in Gemfile.
```
bundle install
```
Make sure all the packages are installed correctly.


### Starting Development Server
* You can start a development server with following command. It will start server on port 3000 by default:
```
rails s 
```
* You can also specify the port by starting server with this command:
```
rails s -p 4000
```

### Stuff used to make this:

 * [Deploy Rails in AWS](https://www.sitepoint.com/deploy-your-rails-app-to-aws/) Installing Rails in remote Ubuntu from scratch adn deploying
 * [Rspec Tutorial](https://www.sitepoint.com/learn-the-first-best-practices-for-rails-and-rspec/) for Best Practices for Rails and RSpec
 * [JWT Tutorial](https://www.sitepoint.com/authenticate-your-rails-api-with-jwt-from-scratch/) for managing authentication with jwt in rails
 * [Discourse API docs](http://docs.discourse.org/)
 * [Faraday gem](https://github.com/lostisland/faraday) for handling API calls to external hosts
 * [Figaro Gem](https://github.com/laserlemon/figaro) For handling environment variables
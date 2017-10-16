# DocGenius Rails App

This README has all the documents used in building this project.

Things covered:

# Tutorials

## Testing

### Rspec Setup
* [Sitepoint Starter Reference](https://www.sitepoint.com/learn-the-first-best-practices-for-rails-and-rspec/)
* [Factory Girl Setup and Faker for model testing](https://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html)
* [Assertion Syntax](https://relishapp.com/rspec/rspec-rails/v/3-6)
* [Integration(Api) Testing](http://matthewlehner.net/rails-api-testing-guidelines/)

### JBuilder Setup
* [Starter](https://richonrails.com/articles/getting-started-with-jbuilder)
* [Detailed Reference](https://devblast.com/b/jbuilder)

## Errors Explaination
* [Scaffold](https://gun.io/blog/using-scaffolding/) - What happend when you use scaffold for generating models in Rails
* [Rails Tutorials](https://www.railstutorial.org/book/toy_app) - Rails tutorials used in building this project
* [Nokogiri Taking a lot of time](https://stackoverflow.com/questions/26878263/libxml2-missing-mac-os-x-10-10) - Install libxml2 and separately and install nokogiri using system libraries
* [Excel Parsing -xls](https://github.com/zdavatz/spreadsheet/blob/master/GUIDE.md) - For parsing xls files only.
* [Excel Parsing -xlsx](https://github.com/weshatheleopard/rubyXL) - For parsing all other type of xlsx file
* [Running scripts from Rails console](https://stackoverflow.com/questions/10313181/pass-ruby-script-file-to-rails-console) 
* [Restarting already existing running server](https://stackoverflow.com/questions/15072846/server-is-already-running-in-rails)
* [Rolling back a failed Rails migration](https://stackoverflow.com/a/5466779)
* [Self Join/Making Tree of model](http://guides.rubyonrails.org/association_basics.html#self-joins) When a model want to reference itself.
* [Rake Tasks](https://www.tutorialspoint.com/ruby-on-rails/rails-and-rake.htm) List of Rake tasks.
* [Copy file to remote](https://stackoverflow.com/a/20943748) How to handle Permission denied(publickey) issue while scp
* Ruby version
2.3.0
* Checking for PID of hung proces running on <PORT> (eg. 3000)
```
lsof -i tcp:<PORT>
Ps -ef | grep <PID>
kill -9 <PID>
```

* Checking for PID of hung process of name <PROCESS_NAME>
```
lsof | grep '<PROCESS_NAME>'
```

## Code References

### Adding Api controller
```
rails generate controller Analytics
```
Move analytics_controller from app/controllers to app/controllers/api.Add a method in the analytics_controller and change existing content as 
```
class Api::AnalyticsController < ApiController
	def trial
		response ={}
	    render json: response.to_json, status: 200
	end
end
```
Inside config/routes.rb, first delete existing route 
```
resources :analytics
```
and add api route.
```
namespace :api, :defaults => {:format => :json} do  
    resources :analytics  do 
      collection do
        get 'analytics' => 'analytics#index'
      end
    end
  end
```
Now you can see the new api on GET [http://localhost:3000/api/analytics](http://localhost:3000/api/analytics/get_analytics)
[Authenticate_user bug](https://github.com/plataformatec/devise/issues/4207)

* Execute file in Rails console

```
bundle exec rails runner "eval(File.read 'your_script.rb')"
```
## Database

### Database configuration
* [Discourse Reference](https://meta.discourse.org/t/beginners-guide-to-install-discourse-on-mac-os-x-macos-for-development/15772)

Open psql prompt
```
psql postgres
```
Create app_development and app_test database with your account short specified as role:
```
CREATE DATABASE app_development WITH OWNER techapj ENCODING 'UTF8' TEMPLATE template0;
CREATE DATABASE app_test WITH OWNER techapj ENCODING 'UTF8' TEMPLATE template0;
```
Exit psql prompt by pressing CTRL+D

Now access psql prompt in app_development database as your short name user:
```
psql -d app_development -U techapj -h localhost
```

### Database initialization
* [Model generate with project with duplicate name](https://stackoverflow.com/a/31857620)
* [Adding Mysql gem to Exisitng Rails App](https://teamtreehouse.com/community/how-do-i-install-the-mysql-gem-and-how-do-i-set-it-as-the-default-database-for-rails) - Adding Mysql gem in Rails when Mysql is already installed
* [MySQL ERROR 2002 (HY000)](https://stackoverflow.com/a/43407957) - When Mysql gives this error. Stop and Restart server.
* [Polymorphic field]
* [Mysqldump](https://stackoverflow.com/a/21302721)
```
rails generate scaffold UserEntityScore entity:references{polymorphic}:index 
``` 
* [Find/Create By multiple reference fields] Be cautious to just use reference only. Any value fields should be updated by directly referencnig the output object
```
stream = Stream.find_or_create_by(:name => stream_name,:subject => subject)
```
* [Find/Create By multiple reference and value fields]
```
user_breakup = UserBreakup.where(:ref_field_1 => ref_object_1, :ref_field_2 =>ref_object_2).first
user_breakup = UserBreakup.create(:ref_field_1 => ref_object_1, :ref_field_2 =>ref_object_2,:value_field_1 => 0, :value_field_1 => 0) if not user_breakup
```
* [Update column attribute]
```
difficulty_breakup.update_column(:count, existing_breakup)  
```

### Migration
* [Migrations Add/Remove Reference](https://stackoverflow.com/questions/5648970/rails-migration-with-adding-and-removing-reference) - Adding and Removing reference using migration
* [Migration Change Table Name](https://stackoverflow.com/questions/471416/how-do-you-write-a-migration-to-rename-an-activerecord-model-and-its-table-in-ra) - How to change Table Name using Migrations
* [Migration to define decimal fields]
```
change_column :table_name, :field_name, :decimal, :precision => 10, :scale => 2
```

### Git Issues
* [Removing git folder inside another git folder](https://stackoverflow.com/a/22013258)

### Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
* [Deploy Rails to AWS](https://www.sitepoint.com/deploy-your-rails-app-to-aws/) 

## Best Practices
### [Sitepoint Reference](https://www.sitepoint.com/10-ruby-on-rails-best-practices-3/)
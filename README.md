# phase-5-final-backend
# Project Title 
Student Motivation App API 

# Description
This is a rails API that supports a react/js front-end about an app that provides authentic information, inspires and advice about the tech world.

"https://github.com/katampoi/phase-5-frontend"

Users are allowed to login or signup for an account if they don't have one. They are also allowed to post and reveiw informational content related to technology. 
This api provides end points that allows one to fetch the data contained in the database and perform CRUD operations.
This api uses postgres database. To get the server started, cd into the parent directory and run;
``` $ rails s ```

# Technologies
The technologies usesd were;

 * Ruby On Rails 
 * Postgres 


# installations

1. ruby
 ```
    $ ruby-install ruby 2.7.4
```
2. rspec
This is a tool that is used for running tests.
```console
   $ gem install rspec
```
To set up, run;
```
   rspec --init
```
 
 3. bundle install 
```console
  $ bundle install
  ```
This will download all the dependencies for our app.


# deployment
This project will be deployed in heroku. You need the heroku-cli installed before you can use this plugin.

~ Install Git and the Heroku CLI.
   ```heroku plugins:install git://github.com/envato/heroku-deploy.git
   ```
~ Create a Heroku Remote
~ Deploy Your Code
```heroku deploy
```



# CrossRater

CrossRater is an application that allows users to search for, and leave reviews of, any CrossFit gym in the world.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisities

CrossRater runs in PostgreSQL, both in Development and Production environments, and as such requires that PostgreSQL be installed locally to run.
Download and installation instructions can be found on the [PSQL website](http://www.postgresql.org/download/).


### Installing

The first step in getting up and running with CrossRater is cloning the repo:

```
git clone https://github.com/ADude2/cf-app.git
```

Install all the necessary depencies:

```
bundle install
```

Create and migrate the database:
```
rake db:create:all
rake db:migrate
```

CrossRater requires PostgreSQL to be running, so ensure the server is running first. Launch it from the terminal:
```
$ postgres -D /usr/local/var/postgres
```

Start Redis by running the following command from the terminal:
```
$ redis-server
```

Start Sidekiq as well from the terminal:
```
$ bundle exec sidekiq
```

Finally, run your Rails server!
```
rails s
```

## Running the tests

Tests are run through RSpec and are contained in the ```app/test``` folder. They can be run from the terminal with the command:
```
$ rspec
```

## Variables and Credentials: 

The Contact form uses ActionMailer, the SMTP details can be found and edited in the ```app/config/initializers/setup_mail.rb``` file.

The Environment variables for the SMTP details of the Mailer should be stored in ```app/config/application.yml``` in the following form:

```
SENDGRID_PASSWORD: xxxx
SENDGRID_USERNAME: xxxx
```

The Email address the Contact form uses to dispatch emails to is located in ```app/mailers/message_mailer.rb```

If using Google Analytics, add the Tracking ID 'UA-XXXXXXXX-X' in the ```app/assets/javascripts/google_analytics.js.coffee``` at the bottom of the script:

```
  @analyticsId: ->
    # your google analytics ID(s) here...
    'UA-XXXXXXXX-X'
```

Feel free to delete the script if analytics won't be necessary.


## Deployment

If deploying to Heroku, CrossRater uses Puma as a production webserver and requires the provisioning of a [Redis add-on](https://devcenter.heroku.com/articles/heroku-redis) as well. Currently, the Procfile located in the ```cf-app``` folder will get the webserver and Sidekiq workers up and running.


## Built With

* Rails 4.2.1
* Ruby 2.0.0
* HTML/CSS/Bootstrap
* JavaScript/jQuery

## Issues

Please feel free to report any bugs or issues https://github.com/ADude2/cf-app/issues

## Authors

* **Alexandre Di Domenico** - *Initial work* - [ADude2](https://github.com/ADude2)




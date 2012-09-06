http://railsapps.github.com/rails-heroku-tutorial.html

Rails 3.2 with Ruby 1.9.3 on Heroku

$ heroku plugins:install git://github.com/ddollar/heroku-accounts.git
$ heroku accounts:add friendly-rent --auto

$ heroku accounts
$ heroku accounts:set friendly-rent

$ heroku create myapp --stack cedar
$ heroku info --app myapp

Configure ruby 1.9.3

$ heroku labs:enable user_env_compile -a friendly-rent
$ heroku config:add RUBY_VERSION=ruby-1.9.3-p125
$ heroku config:add PATH=bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin

$ heroku config

Mongo DB

$ heroku addons:add mongohq:free
$ git push heroku master
$ heroku run rake db:seed
$ heroku restart

Before looking at the app on the web, let’s check the state of the app’s processes:

$ heroku ps

Cedar allows you to launch a Rails console process attached to your local terminal for experimenting in your app’s environment:

$ heroku run console

Procfile

Change the command used to launch your web process by creating a Procfile, like this:

web: bundle exec rails server thin -p $PORT -e $RACK_ENV
Set the RACK_ENV to development in your environment

$ echo "RACK_ENV=development" >>.env
Test your Procfile locally using Foreman:

$ foreman start
11:35:11 web.1     | started with pid 3007
11:35:14 web.1     | => Booting thin

$ heroku open

# Gmail
$ heroku config:add GMAIL_USERNAME=no-reply@example.com GMAIL_PASSWORD=please

---

http://blog.heroku.com/archives/2011/6/20/the_new_heroku_1_process_model_procfile/

http://blog.heroku.com/archives/2011/5/31/celadon_cedar/

## Scheduler
https://devcenter.heroku.com/articles/scheduler

Install Add-on

$ heroku addons:add scheduler:standard

The dashboard can also be opened from the command:

$ heroku addons:open scheduler

---

Indexing and full-text search in the cloud:

https://addons.heroku.com/flying_sphinx

---

New Process model: https://devcenter.heroku.com/articles/process-model

web:          bundle exec rails server mongrel -p $PORT
worker:       bundle exec rake resque:work QUEUE=*
urgentworker: bundle exec rake resque:work QUEUE=urgent
tweetscan:    bundle exec ruby tweetscan.rb
cron:         bundle exec clockwork clock.rb

Scaling workers

$ heroku ps:scale web=2 worker=4 clock=1
Scaling web processes... done, now running 2
Scaling worker processes... done, now running 4
Scaling clock processes... done, now running 1
Process types, on the horizontal axis, are workload diversity. Each process type specializes in a certain type of work.

For example, some apps have two types of workers, one for urgent jobs and another for long-running jobs. By subdividing into more specialized workers, you can get better responsiveness on your urgent jobs and more granular control over how to spend your compute resources. A queueing system can be used to distribute jobs to the worker processes.

Scheduling Processes

Scheduling work at a certain time of day, or time intervals, much like cron does, can be achieved in a number of ways.

One approach is to use something like the Heroku Scheduler add-on that lets you execute any code within your application at scheduled intervals. It’s essentially a declarative approach to scheduling - an explicit process type isn’t used - the command scheduled in Heroku Scheduler is simply executed as a one-off process at the specified interval.

As an alternative approach, use a specialized process type run as a singleton process. This process can use a library to programmatically schedule tasks. For example, in Ruby you can use resque-scheduler or Clockwork.


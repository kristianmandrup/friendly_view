# gem 'resque-heroku-autoscaler', '~> 0.2.3', :git => 'git://github.com/kristianmandrup/resque-heroku-autoscaler.git'
# gem 'heroku-auto_scale', :git => 'git://github.com/kristianmandrup/heroku-auto_scale.git'

# http://blog.daviddollar.org/2011/05/06/introducing-foreman.html
# Using foreman you can declare the various processes that are needed to run your application using a Procfile.

# web:    bundle exec thin start -p $PORT
# worker: bundle exec rake resque:work QUEUE=*
# clock:  bundle exec rake resque:scheduler

# Upstarting crashed processes
# http://michaelvanrooijen.com/articles/2011/06/08-managing-and-monitoring-your-ruby-application-with-foreman-and-upstart/

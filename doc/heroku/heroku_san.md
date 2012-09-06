http://blog.leshill.org/blog/2010/11/02/heroku-environment-variables.html

Configure heroku environment variables

$ thor deploy:staging:config


See https://github.com/fastestforward/heroku_san

## Configure

In config/heroku.yml you will need to add the Heroku apps that you would like to attach to this project. You can generate this file by running:

rake heroku:create_config
Customize the file for your project. If this is a fresh project, heroku_san can create all the applications for you, and set each one’s RACK_ENV.

rake all heroku:create heroku:rack_env
Configure your Heroku apps according to config/heroku.yml by running:

rake all heroku:config

## Usage

After configuring your Heroku apps you can use rake tasks to control the apps.

rake production deploy
A rake task with the shorthand name of each app is now available and adds that server to the list that subsequent commands will execute on. Because this list is additive, you can easily select which servers to run a command on.

rake demo staging restart
A special rake task ‘all’ is created that causes any further commands to execute on all heroku apps.

Manipulate collaborators on all this project’s apps (prompts for email address):

rake all heroku:share
rake all heroku:unshare
Need to add remotes for each app?

rake all heroku:remotes
A full list of tasks provided:

rake heroku:addons                # Install addons for the application.
rake heroku:addons:local          # List configured addons, without installing them
rake heroku:apps                  # Lists configured apps
rake heroku:apps:local            # Lists configured apps without hitting heroku
rake heroku:config                # Add config:vars to each application.
rake heroku:config:list           # Lists config variables as set on Heroku
rake heroku:config:list:local     # Lists local config variables without setting them
rake heroku:config:rack_env       # Add proper RACK_ENV to each application
rake heroku:console               # Opens a remote console
rake heroku:create                # Creates the Heroku app
rake heroku:create_config         # Creates an example configuration file
rake heroku:db:migrate            # Migrates and restarts remote servers
rake heroku:db:pull               # Pull database from stage to local dev database
rake heroku:deploy[commit]        # Pushes the given commit, migrates and restarts (default: HEAD)
rake heroku:deploy:after          # Callback after deploys
rake heroku:deploy:before         # Callback before deploys
rake heroku:deploy:force[commit]  # Force-pushes the given commit, migrates and restarts (default: HEAD)
rake heroku:logs                  # Shows the Heroku logs
rake heroku:logs:tail             # Tail the Heroku logs (requires logging:expanded)
rake heroku:maintenance           # Enable maintenance mode
rake heroku:maintenance_off       # Disable maintenance mode
rake heroku:maintenance_on        # Enable maintenance mode
rake heroku:push[commit]          # Pushes the given commit (default: HEAD)
rake heroku:push:force[commit]    # Force-pushes the given commit (default: HEAD)
rake heroku:rake[task]            # Runs a rake task remotely
rake heroku:remotes               # Add git remotes for all apps in this project
rake heroku:restart               # Restarts remote servers
rake heroku:share                 # Adds a collaborator (asks for email)
rake heroku:unshare               # Removes a collaborator (asks for email)
rake heroku:stage:all             # Select all Heroku apps for later command


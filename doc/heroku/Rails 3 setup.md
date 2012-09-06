Rails 3.x + Cedar
https://devcenter.heroku.com/articles/rails3

Rails 3.1 + Cedar
https://devcenter.heroku.com/articles/rails3x-asset-pipeline-cedar

The Rails asset pipeline provides an assets:precompile rake task to allow assets to be compiled and cached up front rather than compiled every time the app boots.


$ RAILS_ENV=production bundle exec rake assets:precompile

A public/assets directory will be created. Inside this directory you’ll find a manifest.yml which includes the md5sums of the compiled assets. Adding public/assets to your git repository will make it available to Heroku.

git add public/assets
git commit -m "vendor compiled assets"

Now when pushing, the output should show that your locally compiled assets were detected:

-----> Preparing Rails asset pipeline
       Detected manifest.yml, assuming assets were compiled locally

IMPORTANT:

If you have not compiled assets locally, we will attempt to run the assets:precompile task during slug compilation. Your push output will show:

-----> Preparing Rails asset pipeline
       Running: rake assets:precompile
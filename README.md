# SVC Greetings
Example RESTful JSON mirco-service  

## Getting Started

        gem install bundler

  
1. Install Bundler

        gem install bundler
        bundle install

2. Create DB user (modify IP to the one postgres is running on)

        createuser greetings -h 192.168.99.100 -p 5433 -U postgres -S -R -d

3. Create and migrate DB

        bundle exec rake db:migrate
        bundle exec rake db:test:prepare

4. Run tests
  
        bundle exec rspec

5. Run server on port 4567
  
        rackup -p 4567

6. Run sidekiq

        bundle exec sidekiq -r ./app/controllers/application_controller.rb

7. Create some greetings

        curl -H "Content-Type: application/json" -X POST -d '{"message":"hi1"}' localhost:4567/greetings
        curl -H "Content-Type: application/json" -X POST -d '{"message":"hi2"}' localhost:4567/greetings
        
8. Check `http://localhost:4567/greetings`

9. Check `http://localhost:4567/health_check`

10. Check `http://localhost:4567/sidekiq`

## Resources
    * [Sinatra Getting Started](http://www.sinatrarb.com/intro.html)
    * [Sinatra Writing Extensions](http://www.sinatrarb.com/extensions.html)
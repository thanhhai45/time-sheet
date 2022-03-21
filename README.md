# README
## Introduce
- Sorry for basic config to run my project. My laptop is old and can't run Docker and docker-compose. However, I was config Dockerfile, docker-compose.yml. You can read and advice your idea to me. Many thanks
- Next step setup your device to run my project
# Setup your device to run project
## Ruby Version
- 2.7.3
## Rails Version
- 6.1.5

## Install Redis
- https://redis.io/topics/quickstart
## Install Postgresql
- https://postgresapp.com/downloads.html
- Open app
# Run rails project

## Install gem
- Run script: ```bundle install```

## Run rake database
- Create database: ```rails db:create```
- Migrate database: ```rails db:migrate```
- Seed data database: ```rails db:seed```

## Run project
- Run script: ```gem install foreman```
- Run script: ```foreman start```
- Open your browser and fill: localhost:3000
- Open sidekiq page: localhost:3000/sidekiq

## Run unit test
- Test Model: ```rspec spec/models/timesheet_spec.rb```
- Test Service: ```rspec spec/services/calculate_salary_service_spec.rb```
- Test Job: ```rspec spec/jobs/sync_entry_working_price_job_spec.rb```

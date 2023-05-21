# Globify Backend

This is a backend API for Globfiy, using Ruby on Rails.

## Setup

Run rails server

```
rails s
```

## Gems

### Add

```
bundle install faker
bundle install active_model_serializers
```

### Chnage

```
gem 'jwt', '~> 2.2'
```

### Uncomment

```
gem "rack-cors"
gem "bcrypt", "~> 3.1.7"
```

Create User Model:
'''
rails g resource user username password_digest --no-test-framework
rails db:migrate
'''

Error Handling
In config/environments/development.rb
'config.hosts.clear'

```

## Rails Notes

Create project without without testing files (-T), with PostgreSQL database (-d=postgresql), API only application (--api)

```

rails new example-project -T -d=postgresql --api

```
gem install - add globally on your machine
bundle install - add locally to project
```

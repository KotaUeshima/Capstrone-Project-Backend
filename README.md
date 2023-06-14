# Globify Backend

This is a backend API for Globify2.0 application (https://github.com/KotaUeshima/globify-frontend2.0)

## Setup

Clone down this repository.

Run rails server:

```
rails s
```

## Gems

Added Gems:

```
gem "active_model_serializers", "~> 0.10.13"
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'
gem "net-http"
gem 'rspotify'
```

Uncommented Gems:

```
gem "rack-cors"
gem "bcrypt", "~> 3.1.7"
```

Edited Gems:

```
gem 'jwt', '~> 2.2'
```

Install gems:

```
bundle install
```

Install gems globally (not recommended):

```
gem install
```

## How to Create Model in Rails?

Use rails generate to create migration with username and password_digest fields, creates User model, UsersController and routes

```
rails g resource user username:string password_digest:string --no-test-framework
rails db:migrate
```

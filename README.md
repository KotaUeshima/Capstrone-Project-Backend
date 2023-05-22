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

Serializer what attributes are rendered when the object/model is converted into JSON

```
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
end
```

### Edit

```
gem 'jwt', '~> 2.2'
```

### Uncomment

```
gem "rack-cors"
gem "bcrypt", "~> 3.1.7"
```

## Rails Notes

### Create Project

Create project without without testing files (-T), with PostgreSQL database (-d=postgresql), API only application (--api)

```
rails new example-project -T -d=postgresql --api
```

### Adding Dependencies

- gem install - add globally on your machine
- bundle install - add locally to project

### Create User Model:

Use **rails generate** to create migration with **username** and **password_digest** fields, creates User model, UsersController and routes

```
rails g resource user username:string password_digest:string --no-test-framework
rails db:migrate
```

**rails g scaffold** is even more estnesive

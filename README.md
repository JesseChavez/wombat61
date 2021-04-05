# Sample Rails 6.1 app with SQL Server

This app was created with

```
rails new wombat -d jdbc
```

Use the `activerecord-jdbc-alt-adapter` and `jdbc-mssql` gem to work with SQL Server

```ruby
platforms :jruby do
  # Use jdbc as the database for Active Record
  gem 'activerecord-jdbc-alt-adapter', '~> 61.0.0'
  gem 'jdbc-mssql', '~> 0.9.0'
end
```

Changed database connections settings to


```yml
# SQL Server (2012 or higher recommended)
# Ensure to add the right port if you are
# not using the default port 1433

default: &default
  adapter: sqlserver
  encoding: utf8

development:
  <<: *default
  host: localhost
  database: wombat_development
  username: dev
  password: password

test:
  <<: *default
  host: localhost
  database: wombat_test
  username: test
  password: password

production:
  <<: *default
  host: localhost
  database: wombat_production
  username: wombat
  password: <%= ENV['WOMBAT_DATABASE_PASSWORD'] %>
```


Scaffold some imaginary pets records:


```
rails g scaffold category name:string description:text
```


```
rails d scaffold pet category:references name:string 'price:decimal{18,2}' age:integer weight:float date_of_birth:date adopted_at:datetime wakeup_time:time desexed:boolean description:text
```

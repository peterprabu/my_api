# README

JWT & Shortener APIs

##### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby '2.5.3'
- Rails '~> 6.0.6', '>= 6.0.6.1'

##### 1. Check out the repository

```bash
git clone git@github.com/peterprabu/my_api.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:migrate
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

##### 4. Postman APIs

```Endpoints
/signup
/login
/shorten
/:shorten_url
```



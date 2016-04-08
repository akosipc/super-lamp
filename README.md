## Pasugalan sa Gorated


#### Version

```
  Ruby 2.3.0
  Rails 4.2.5.2
  Postgres 9.3
  Redis Server
  Sidekiq
  Bootstrap 3
  Node.js
  React 0.14.x
```

#### Installation

```
  $ git clone git@github.com/akosipc:super-lamp.git
  $ cd blissart
```

#### Setup

```
  $ bundle install
```

#### Starting the application

```
  $ rails server
  $ redis-server
  $ sidekiq -q default
```

#### Configuration

  Copy `database.yml.sample` to `database.yml` and `secrets.yml.sample` to `secrets.yml`

#### Database creation

```
  $ rake db:create db:migrate db:test:prepare
```

#### How to run the test suite

```
  $ rspec spec
```

#### Tips and Notes
- When using pow.cx, some changes might not affect immediately. You can restart the server and enter `touch tmp/restart.txt` to update it.
- If you cannot install assets via rails-assets.org, please check your bundler version. Bundler version should be `>= 1.8.4`.
- If you get errors that node modules are not found, do `rake tmp:cache:clear` and delete `tmp` directory in the Rails app.




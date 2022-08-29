# EMerchantPay-Test

#### Native Database Setup

1. Install and Start Postgres
   * `brew install postgresql && brew services start postgresql`
   * Export the environment variables in application.yml. This will help later when installing the Postgres gem.
2. Make sure the `psql` command is available in CLI. If not, add the following: `export PATH=/usr/local/opt/postgresql@12/bin:$PATH` to your `.bash_profile` or `.zshrc` file
3. Postgres Setup:
  * `psql -c 'CREATE USER postgres SUPERUSER;' postgres`
4. Install and start Redis:
  * `brew install redis && brew services start redis`

#### Native Ruby Setup

1. Install Ruby using the version found in the `.ruby-version` file using a Ruby/language version manager. [Asdf](https://asdf-vm.com/) is recommended.
2. Install Gem dependencies:
   * `bundle`

#### Native Data Setup

1. Postgres:
    * `bundle exec rake db:create`

#### Native Application Launch

`bundle exec rails server`

## Testing

Create the test database (one time setup): `RAILS_ENV=test bundle exec rake db:create`. Then, unit tests can be run with Rspec: `bundle exec rspec`. Also note that the default Rake task will run both Rspec and Rubocop: `bundle exec rake`.

### Sidekiq/Background Jobs

* Start Sidekiq:
  * `bundle exec sidekiq`
* View in web: `/jobs`
  * `username: development, password: 'hello#admin'`

## Continuous Improvement

There are a couple of areas of our application which will be improved over time. The goal is to address these items as development progresses in different areas of the application. Leave the code in a better state than when you began. Few changes have implemented but not used yet
but if asked I will make them running as well

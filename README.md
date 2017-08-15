# README 1


## Development

```
rails new rails-calc --skip-action-mailer --skip-action-cable --skip-coffee --skip-turbolinks --skip-test --skip-system-test
git remote add origin https://github.com/dev-branch/rails-calc.git
rails s

- add gems -
bundle install

rails generate rspec:install
rails generate rspec:model calculator
rails generate rspec:controller calc
rails generate rspec:feature calculation

rspec
```

## Production

```
npm i -g yarn

rails assets:clobber

RAILS_ENV=production rails assets:precompile

SECRET_KEY_BASE=44efda518ab1dd8b23b21447697a5f01dee829bf0863b32f1c13cef3905f82b79b4a33796a3a51a5ec9609bd4e05f6899c053a21c6640469262acbdf9c965102
RAILS_ENV=production
RAILS_SERVE_STATIC_FILES=true
rails s
```

`config/secrets.yml`



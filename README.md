# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Features

* Products can now display a "Sold Out" badge if the product is unavailable
* Order that successfully process now have a confirmation page that lists the items they purchased, the total price and the mail to which the order confirmation is sent to
* Admins can now login to the admin page and add new products and categories as they see fit
* Users can register, login and logout with all the necessary validation and password security required for an ecommerce page

## Fixed Bugs

* Admin security is now properly implemented with HTTP authorization for the admin's username and password
* Display changes for when the user visits the "My Cart" page with no items for checkout, prompting them to continue shopping


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Testing Environments

* RSPEC
* Database Cleaner
* Capybara
* PhantomJS/Poltergeist
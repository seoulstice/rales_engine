# Rales Engine

Rales engine is a RESTful API for eCommerce business intelligence. It is made with Ruby on Rails and returns JSON objects for Merchants, Customers, Invoices, Items, Invoice Items and Transactions. Below are instructions on how to setup, install, deploy, run tests, and make API calls.

## Setup & Installation

Fork the Rales Engine Github repository and clone it down into a directory of your choosing.

```
git clone https://github.com/seoulstice/rales_engine.git
```

In this same directory, you will want to clone down the Rales Engine spec harness.

```
https://github.com/tylermarshal/rales_engine_spec_harness
```

Move into the rales engine directory & bundle.

```
cd rales_engine
```
```
bundle install
```

From here you will need to set up the databases:

```
rails db:create db:migrate
```

CSV data is included and can be imported into the databse with the following rake task:

```
bundle exec rake import_all
```

You can check to ensure the data was import correctly by doing the following in your terminal and ensuring each table is not blank:

```
rails c
Merchant.all
Customer.all
Invoice.all
Item.all
Item_invoice.all
Transaction.all
```

If the data is not there, reset your database and try the rake task again:

```
bundle exec rake db:reset
bundle exec rake import_all
```

## Testing

To begin testing, you will want start a server for the rales_engine directory:

```
rails s
```

Enter the following into the terminal to run the local test suite:

```
bundle exec rspec
```

To run the spec harness, move to the directory that rales_engine and rales_engine_spec_harness are both located in, then change to the rales_engine_spec_harness root directory:

```
cd ..
cd rales_engine_spec_harness
```



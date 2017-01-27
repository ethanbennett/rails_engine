# README

### Welcome to Rales Engine!!
In this project we:
- Learned how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
- Learned how to use controller tests to drive our design.
- Used Ruby and ActiveRecord to perform more complicated business intelligence.

### Preparing Our API

#### STEP ONE:
Copy and paste the following line into your terminal:
```
git clone https://github.com/jdconrad89/rails_engine.git
```
This clones down the api onto your computer.

#### STEP TWO
In your terminal type these commands in the following order:
```
bundle
```
This installs all the necessary gems you will need to utilize our API.

```
rake db:create
```
This will create the database that you need (please make sure that postgres is downloaded and turned on)

```
rake db:migrate
```
This will create the tables for your objects in the database.

```
rake import_files
```
This will download and create all the objects into your database.
```
rails s
```

And there you have it! Look below to see all the information you have access to!
```
/api/v1/merchants/:id/revenue
```
This returns the total revenue for that merchant across all transactions.

```
/api/v1/merchants/:id/revenue?date=x
```
This returns the total revenue for that merchant for a specific invoice date x.

```
/api/v1/merchants/most_items?quantity=x
```
This returns the customer who has conducted the most total number of successful transactions.

```
/api/v1/merchants/:id/customers_with_pending_invoices

```
This returns a collection of customers which have pending (unpaid) invoices.

```
/api/v1/customers/:id/favorite_merchant
```
This returns a merchant where the customer has conducted the most successful transactions.


```
/api/v1/items/:id/best_day
```
This returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

```
/api/v1/items/most_items?quantity=x
```
This returns the top x item instances ranked by total number sold.

```
/api/v1/items/most_revenue?quantity=x
```
This returns the top x items ranked by total revenue generated.

```
/api/v1/merchants/:id/favorite_customer
```
This returns the customer who has conducted the most total number of successful transactions.

```
/api/v1/merchants/revenue?date=x
```
This returns the total revenue for that merchant for a specific invoice date x.

```
/api/v1/merchants/most_revenue?quantity=x
```
This returns the top x merchants ranked by total revenue.


You can also:

Search any one of the objects by simply adding a
```
/object_type
```
for example:

```
/merchants
```

would return a page containing all of the merchants in the database.

You can also look up objects by any given element in the object.

For example:

```
/merchants/find?id=7
```

would return the merchant with that ID.

You can also find all objects that have an applicable element.

For example:

```
/items/find_all?unit_price=123456
```

would return all the items with that unit price.

Also! You can find a random object simply by adding:

```
/merchants/random
```

Enjoy your time on Rales Engine!!

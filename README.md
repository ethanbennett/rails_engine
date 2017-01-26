# README

### Welcome to Rails Engine!!
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

#### STEP TWO
In your terminal type these commands in the following order:

```
rake db:create
```

```
rake db:migrate
```

```
rake import_files
```

And there you have it! Look below to see all the information you have access to!
```
/api/v1/merchants/:id/revenue
```

```
/api/v1/merchants/:id/revenue?date=x
```

```
/api/v1/merchants/most_items?quantity=x
```

```
/api/v1/customers/:id/favorite_merchant
```

```
/api/v1/items/:id/best_day
```

```
/api/v1/items/most_items?quantity=x
```

```
/api/v1/merchants/:id/customers_with_pending_invoices
```

```
/api/v1/merchants/:id/favorite_customer
```

```
/api/v1/items/most_revenue?quantity=x
```

```
/api/v1/merchants/revenue?date=x
```

```
/api/v1/merchants/most_revenue?quantity=x
```

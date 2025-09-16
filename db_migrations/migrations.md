## Django Database Migration Fix Guide

> This docs for I wrote for my Django migration fixing. I got a little bit problem when I got migration error.

### Let's see:

```bash
psql -U postgres -d mydb -f /Users/dev/mydb.dump
```

###### Fixing issue:

```sql
ALTER TABLE event_event ADD COLUMN custom_ticket_price NUMERIC;
ALTER TABLE sponsor_ticket ADD COLUMN transaction_id INTEGER;
ALTER TABLE event_paymenthistory ADD COLUMN payment_type INTEGER;
```

#### Notes:

```bash
python manage.py makemigrations
python manage.py migrate --fake
```

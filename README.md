# README

## Instructions for the Reviewer
### How to set up and test my implementation

#### Option 1 (simpler, recommended approach)
1. Go to https://aqueous-woodland-18926.herokuapp.com/ 
Note: Because it's a heroku app, it can take some time to load, but it will load up if you wait!
2. On this page, you can run through the test cases.
3. Go to https://aqueous-woodland-18926.herokuapp.com/payment_intents (or click the "Payment Intents Log" navigation link) to see the registry of all the successful payments that I would need to fulfill

#### Option 2 (more complicated, I do not recommend)
Depending on your OS, specific ways to download Ruby and Postgres will vary. 
1. Install Ruby version 2.7.0
2. Install postgresql
3. Install Rails version 6.0.2.2
4. Pull my repository into your local environment
5. Create a database called `myrailsapp_dev` with username `neeharika` or update database.yml to reflect the database name and username you have
6. Run `bundle install`
7. Run `rake db:create`
8. Run `rake db:migrate`
9. Run `rake routes`
10. Run `rails s`
11. Install Stripe CLI and Log In
12. Run `stripe listen --forward-to localhost:3000/hooks`
14. Copy the webhook signing secret
11. Create a file called .env in the root folder with two lines:
  * `STRIPE_API_SECRET_KEY={INSERT YOUR STRIPE API SECRET KEY HERE}`
  * `STRIPE_API_PUBLISHABLE_KEY= {INSERT YOUR STRIPE PUBLISHABLE KEY HERE}`
  * `STRIPE_WEBHOOK_SECRET = {INSERT YOUR WEBHOOK SIGNING SECRET HERE}`
11. Visit http://localhost:3000
12. On this page, you can run through the test cases.
13. Go to http://localhost:3000/payment_intents (or click the "Payment Intents Log" navigation link) to see the registry of all the successful payments that I would need to fulfill

### Friction Log
A PDF of my friction log is submitted, but [here's a Google Doc](https://docs.google.com/document/d/17QEYvpfA3eqSoeynRMV4Bu-__MiZc28ypODnJAhlpF8/edit?usp=sharing) as well.

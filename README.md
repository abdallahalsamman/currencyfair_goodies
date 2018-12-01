### System dependencies
RVM: please follow this guide to install rvm https://rvm.io/rvm/install#basic-install

### Installation
```
git clone https://github.com/evexoio/currencyfair_goodies.git
cd currencyfair_goodies/
rvm install "ruby-2.4.4"
bundle
rails db:migrate
rails db:seed
rails s
```

### Usage

#### Report Page
You can see the monthly or yearly report at http://localhost:3000/

#### Process Transaction
```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"userId": "134256", "currencyFrom": "EUR", "currencyTo": "GBP", "amountSell": 1000, "amountBuy": 747.10, "rate": 0.7471, "timePlaced" : "24-JAN-15 10:27:44", "originatingCountry" : "FR"}' \
  http://localhost:3000/api/process_transaction
```

### How to run the test suite
Make sure you're in the project's directory then execute `rails test`

### Look & Feel
![shot-20181201-28139-fu1y8u](https://user-images.githubusercontent.com/12014839/49326042-d2f30500-f554-11e8-8b28-f86c9ba52c23.jpeg)

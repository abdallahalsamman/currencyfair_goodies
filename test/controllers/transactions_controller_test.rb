require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should accept transaction" do
    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "EUR", currencyTo: "GBP", "amountSell": 1000,
                   amountBuy: 747.10, rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FR"}
    assert_response :success
  end

  test "should reject transaction with same currencyFrom and currencyTo" do
    # same currencyFrom and currencyTo
    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "GBP", currencyTo: "GBP", "amountSell": 1000,
                   amountBuy: 747.10, rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FR"}
    assert_response :bad_request
  end

  test "should reject transaction with amountSell or amountBuy as a string" do
    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "GBP", currencyTo: "EUR", "amountSell": 'wrong_type',
                   amountBuy: 747.10, rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FR"}
    assert_response :bad_request

    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "GBP", currencyTo: "EUR", "amountSell": 123.1,
                   amountBuy: 'wrong_type', rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FR"}
    assert_response :bad_request
  end

  test "should reject transaction with currencyFrom or currencyTo as invalid currency name" do
    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "GBPA", currencyTo: "EUR", "amountSell": 1000,
                   amountBuy: 747.10, rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FR"}
    assert_response :bad_request

    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "EUR", currencyTo: "GBPP", "amountSell": 1000,
                   amountBuy: 747.10, rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FR"}
    assert_response :bad_request
  end

  test "should reject transaction with originatingCountry as invalid short country code" do
    post '/api/process_transaction', params: {userId: "134256", currencyFrom: "EUR", currencyTo: "GBP", "amountSell": 1000,
                   amountBuy: 747.10, rate: 0.7471, timePlaced: "24-JAN-15 10:27:44", originatingCountry: "FRCA"}
    assert_response :bad_request
  end
end

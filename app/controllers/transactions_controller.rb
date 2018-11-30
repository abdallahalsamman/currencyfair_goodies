class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @transactions = Transaction.all
    end

    def create
      params.transform_keys!(&:underscore) # converting parameters to snake_case e.g currencyFrom to currency_from
      params.transform_keys!(&:to_sym) 

      transaction = Transaction.new(
        params.permit(:user_id, :currency_from, :currency_to, :amount_sell, :amount_buy, :rate, :time_placed, :originating_country))

      if transaction.save
        render plain: "Transaction Saved.\n"
      else
        render plain: "Oops, something went wrong.\n" << transaction.errors.messages.to_s << "\n"
      end
    end
end

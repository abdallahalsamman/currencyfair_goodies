class Transaction < ApplicationRecord
  validates :originating_country, length: { minimum: 2 }
  validates :currency_from, :currency_to, length: { minimum: 3 }
  validates_numericality_of :amount_buy, :amount_sell, :rate, :greater_than => 0.0
  validate :check_different_currencies_from_to

  def check_different_currencies_from_to
    errors.add(:currency_from, "can't be the same as currency_to") if currency_from == currency_to
  end

  def time_placed=(date)
    self[:time_placed] = DateTime.parse(date)
  end
end

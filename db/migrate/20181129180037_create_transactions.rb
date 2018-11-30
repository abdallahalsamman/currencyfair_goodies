class CreateTransactions < ActiveRecord::Migration[5.0]
  def up
    create_table :transactions do |t|
      t.integer :user_id
      t.string :currency_from
      t.string :currency_to
      t.float :amount_sell
      t.float :amount_buy
      t.float :rate
      t.datetime :time_placed
      t.string :originating_country

      t.timestamps
    end
  end

  def down
    drop_table :transactions
  end
end

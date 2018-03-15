class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string  :transaction_type,      null: false, default: 'transfer'
      t.integer :sender_id,             null: false, default: 0
      t.integer :receiver_id,           null: false
      t.integer :amount,                null: false

      t.timestamps
    end
  end
end

class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :account_balance
      t.references :user

      t.timestamps
    end
  end
end

class CreateBankStatement < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_statements do |t|
      t.references :user

      t.string :account_name
      t.string :account_number
      t.string :bank_name
      t.string :bank_key
      t.date :from_date
      t.date :to_date
      t.jsonb :transactions
      t.text :metadata

      t.timestamps
    end
  end
end

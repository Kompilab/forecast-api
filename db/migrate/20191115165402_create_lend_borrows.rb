class CreateLendBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :lend_borrows do |t|
      t.references :user
      t.references :contact

      t.float :amount
      t.text :notes
      t.string :status
      t.string :type
      t.date :date_due
      t.date :date
      t.boolean :deleted, default: false, null: false

      t.timestamps
    end
  end
end

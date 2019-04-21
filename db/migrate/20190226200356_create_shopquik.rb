class CreateShopquik < ActiveRecord::Migration[5.2]
  def change
    create_table :shopquiks do |t|
      t.references :user
      t.references :category

      t.string :item
      t.integer :quantity
      t.float :amount
      t.text :details
      t.string :status
      t.datetime :last_status_update
      t.string :type

      t.timestamps
    end
  end
end

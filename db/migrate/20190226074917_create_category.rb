class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :parent_category

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

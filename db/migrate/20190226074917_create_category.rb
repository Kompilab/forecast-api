class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :category_type

      t.timestamps
    end
  end
end

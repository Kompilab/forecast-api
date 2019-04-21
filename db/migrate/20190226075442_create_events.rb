class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.date :event_date
      t.string :event_type
      t.references :user

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name

      t.text :description

      t.date :end_date
      t.date :start_date

      t.time :starts_at
      t.time :ends_at

      t.timestamps null: false
    end
  end
end

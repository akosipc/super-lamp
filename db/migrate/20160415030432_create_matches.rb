class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name

      t.date :end_date
      t.date :start_date

      t.time :starts_at
      t.time :ends_at

      t.integer :match_id
      t.integer :team_a_id
      t.integer :team_b_id

      t.timestamps null: false
    end
  end
end

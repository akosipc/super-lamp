class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :uid
      t.string :token
      t.string :token_secret
      t.string :avatar

      t.integer :user_id

      t.timestamps null: false
    end
  end
end

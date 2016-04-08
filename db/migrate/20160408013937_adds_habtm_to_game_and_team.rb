class AddsHabtmToGameAndTeam < ActiveRecord::Migration
  def change
    create_table :games_teams, id: false do |t|
      t.references :game
      t.references :team
    end

    add_index :games_teams, [:game_id, :team_id], unique: true
  end
end

class CreateMatchPlayers < ActiveRecord::Migration
  def change
    create_table :match_players do |t|
      t.integer :match_id
      t.integer :player_id
      t.timestamps null: false
    end

    drop_table :match_team_players
  end
end

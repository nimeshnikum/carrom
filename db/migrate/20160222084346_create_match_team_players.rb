class CreateMatchTeamPlayers < ActiveRecord::Migration
  def change
    create_table :match_team_players do |t|
      t.integer :match_id
      t.integer :team_id
      t.integer :player_id      
    end
  end
end

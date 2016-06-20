class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      t.integer :tournament_team_id
      t.integer :player_id
      t.integer :buy_price

      t.timestamps null: false
    end
  end
end

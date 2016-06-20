class CreateMatchTeams < ActiveRecord::Migration
  def change
    create_table :match_teams do |t|
      t.integer :match_id
      t.integer :tournament_team_id

      t.timestamps null: false
    end
  end
end

class RemoveTeamIdInMatchTeamPlayerTable < ActiveRecord::Migration
  def change
    remove_column :match_team_players, :team_id
  end
end

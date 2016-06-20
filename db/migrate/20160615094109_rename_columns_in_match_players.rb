class RenameColumnsInMatchPlayers < ActiveRecord::Migration
  def change
    rename_column :match_players, :match_id, :match_team_id
    rename_column :match_players, :player_id, :team_player_id
  end
end

class UpdateMatchesTable < ActiveRecord::Migration
  def change
    rename_column :matches, :queen_team_id, :queen_player_id
    remove_column :matches, :comments
  end
end

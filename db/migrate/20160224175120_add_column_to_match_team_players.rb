class AddColumnToMatchTeamPlayers < ActiveRecord::Migration
  def change
    add_column :match_players, :queen_pocket, :boolean, :default => false
    add_column :match_players, :coin_count, :integer, :default => false
    add_column :match_players, :opp_coin_count, :integer, :default => false
    add_column :match_players, :due_count, :integer, :default => false
  end
end

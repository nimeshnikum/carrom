class Player < ActiveRecord::Base
  belongs_to :team

  def self.available_players
    Player.where("team_id" => nil).count
  end

  def self.get_random_player
    Player.where("team_id" => nil).shuffle.first
  end
end

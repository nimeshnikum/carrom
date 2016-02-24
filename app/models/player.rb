class Player < ActiveRecord::Base
  belongs_to :team
  has_many :queens, :class_name => 'Match', :foreign_key => 'queen_player_id'
  has_many :matches,  :through => :match_players
  has_many :match_players, dependent: :destroy

  def self.available_players
    Player.where("team_id" => nil).count
  end

  def self.get_random_player
    Player.where("team_id" => nil).shuffle.first
  end

  def matches_count
    self.queens.count
  end

  def queen_count
    self.queens.count
  end

  def coin_count
    0
  end

  def op_coin_count 
    0
  end

  def due_count
    0
  end

  def player_score
    0
  end
end

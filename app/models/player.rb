class Player < ActiveRecord::Base
  has_many :team_players
  has_many :tournament_teams, through: :team_players
  has_many :queens, :class_name => 'Match', :foreign_key => 'queen_player_id'
  # has_many :matches,  :through => :match_players
  # has_many :match_players, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }

  def self.available_players(tournament)
    active - tournament.players
  end

  def self.get_random_player
    Player.where("team_id" => nil).shuffle.first
  end

  def matches_count
    self.matches.count
  end

  def queen_count
    self.queens.count
  end

  def coin_count
    matches = MatchPlayer.where(player_id: self.id)
    matches.map { |x| x.coin_count.to_i }.sum
  end

  def opp_coin_count 
    matches = MatchPlayer.where(player_id: self.id)
    matches.map { |x| x.opp_coin_count.to_i }.sum
  end

  def due_count
    matches = MatchPlayer.where(player_id: self.id)
    matches.map { |x| x.due_count.to_i }.sum
  end

  def player_score
    (coin_count + (queen_count*3)) - (opp_coin_count + due_count).round
  end
end

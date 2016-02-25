class Team < ActiveRecord::Base
  has_many :players
  has_many :won_matches, class_name: 'Match', foreign_key: 'winning_team_id'

  has_one :team

  def matches
  	Match.where("team1_id = ? OR team2_id = ?", self.id, self.id)
  end

  def lost_matches
  	matches - won_matches
  end

  def win_points
    won_matches.count * 15
  end

  def queen_matches
  	Match.where(queen_player_id: player_ids)
  end

  def queen_points
  	queen_matches.count * 5
  end

  def match_points
  	win_points + queen_points
  end

  def total_amount
    self.score - (self.players.map { |x| x.score }.sum)
  end
end

class Team < ActiveRecord::Base
  has_many :players
  has_one :team

  def total_amount
    self.score - (self.players.map { |x| x.score }.sum)
  end

  def match_points
    match_points = Match.where(winning_team_id: self.id).count*15
  end
end

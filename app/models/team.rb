class Team < ActiveRecord::Base
  has_many :players
  has_many :winning_matches, :class_name => 'Match', :foreign_key => 'winning_team_id'
  def total_amount
    self.score - (self.players.map { |x| x.score }.sum)
  end

  def match_points
    match_points = Match.where(winning_team_id: self.id).count*15
    queen_points = Match.joins("inner join players on players.id = matches.queen_player_id and players.team_id = #{self.id}").count*5
    match_points + queen_points
  end

  def board_points
    (self.winning_matches.map { |x| x.board_points if !x.board_points.nil?})
  end
end

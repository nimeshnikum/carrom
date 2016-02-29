class Match < ActiveRecord::Base
  has_many :match_players, dependent: :destroy
  has_many :players,  :through => :match_player

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'  
  belongs_to :winning_team, :class_name => 'Team', :foreign_key => 'winning_team_id'
  belongs_to :queen_holder, :class_name => 'Player', foreign_key: 'queen_player_id'

  attr_accessor :player1, :player2, :player3, :player4

  scope :played, -> { where("winning_team_id IS NOT NULL") }

  def teams
    [self.team1 , self.team2]
  end

  4.times do |i|
    define_method("player_#{i+1}".to_sym) do # player_1, player_2, player_3, player_4
      self.match_players[i].player
    end
  end
end

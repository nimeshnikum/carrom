class Match < ActiveRecord::Base
  has_many :match_players, dependent: :destroy
  has_many :players,  :through => :match_player

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'  
  belongs_to :winning_team, :class_name => 'Team', :foreign_key => 'winning_team_id'
  belongs_to :queen_holder, :class_name => 'Player', foreign_key: 'queen_player_id'

  attr_accessor :player1, :player2, :player3, :player4

  def teams
    [self.team1 , self.team2]
  end

  def player_1
    player = self.match_players[0].player
    player if player.team == self.team1
  end

  def player_2
    player = self.match_players[1].player
    player if player.team == self.team1
  end

  def player_3
    player = self.match_players[2].player
    player if player.team == self.team2
  end

  def player_4
    player = self.match_players[3].player
    player if player.team == self.team2
  end

end

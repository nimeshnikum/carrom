class Match < ActiveRecord::Base
  has_many :players,  :through => :match_player
  has_many :match_players, dependent: :destroy

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'  
  belongs_to :winning_team, :class_name => 'Team', :foreign_key => 'winning_team_id'  

  attr_accessor :player1, :player2, :player3, :player4, :queen_player

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

  def queen_holder
    Player.find(self.queen_player_id)
  end

end

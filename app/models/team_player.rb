class TeamPlayer < ActiveRecord::Base
  belongs_to :tournament_team
  belongs_to :player

  validates :tournament_team_id, :player_id, :buy_price, presence: true
  validates :tournament_team_id, uniqueness: { scope: :player_id }

  delegate :name, to: :player, prefix: true
end

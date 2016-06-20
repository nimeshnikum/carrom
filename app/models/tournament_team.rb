class TournamentTeam < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :team

  has_many :team_players
  has_many :players, through: :team_players

  validates :tournament_id, :team_id, presence: true
  validates :tournament_id, uniqueness: { scope: :team_id }

  delegate :name, to: :team, prefix: true
end

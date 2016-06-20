class Tournament < ActiveRecord::Base
  has_many :tournament_teams
  has_many :teams, -> { uniq }, through: :tournament_teams
  has_many :team_players, through: :tournament_teams
  has_many :players, through: :team_players

  validates :name, presence: true, uniqueness: true
end

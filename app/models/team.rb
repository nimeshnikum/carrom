class Team < ActiveRecord::Base
  has_many :players
  has_one :team

  def total_amount
    self.score - (self.players.map { |x| x.score }.sum)
  end
end

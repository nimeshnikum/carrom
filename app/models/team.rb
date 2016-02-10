class Team < ActiveRecord::Base
  has_many :players

  def total_amount
    self.score - (self.players.map { |x| x.score }.sum)
  end

end

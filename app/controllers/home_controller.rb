class HomeController < ApplicationController
  def index
    @team = Team.order('id ASC')
  end
end

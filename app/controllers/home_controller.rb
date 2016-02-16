class HomeController < ApplicationController
  def index
    
  end

  def team_list
    #@available_players = Player.available_players
    @team = Team.order('id ASC')
  end

  def show_player
    @team = Team.order('id ASC')
    @player = Player.get_random_player
    render_success("show_player", player: @player, team: @team)
  end

  def assign_player
    @player = Player.find(params[:id])
    @player.update(player_params)
    redirect_to root_path
  end

  def player_params
    params.require(:player).permit(:name, :score, :team_id, :image)
  end
end

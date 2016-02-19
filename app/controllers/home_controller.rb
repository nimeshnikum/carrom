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

  def match_list
    @matches = [
      ['Monday 22-02-2016', "Match 1", "Dynamics", "Croods", "Sumesh and Sandesh", "Ashwin and Ravindhran"],
      ['Monday 22-02-2016', "Match 2", "Croods", "Crackers", "Shijo and Kannan", "Ashwin and Ravindhran"],
      ['Monday 22-02-2016', "Match 3", "Crackers", "Dynamics", "Sathya and Krishnaveni", "Srihari and Srikanth"],
      ['Tuesday 23-02-2016', "Match 4", "Dynamics", "Crackers", "Vikram and Partha", "Ankur and Sowmya"],
      ['Tuesday 23-02-2016', "Match 5", "Dynamics", "Croods", "Anoop and Vinaya", "Vinayak and Ravindhran"],
      ['Tuesday 23-02-2016', "Match 6", "Crackers", "Croods", "Vaishakh and Shashi", "Sudhakar and Vaishnavi"],
      ['Friday 26-02-2016', "Match 7", "Crackers", "Croods", "Sathya and Jaydip", "Sudhakar and Vaishnavi"],
      ['Friday 26-02-2016', "Match 8", "Crackers", "Dynamics", "Vaishakh and Johnson", "Prasad and Srikanth"],
      ['Friday 26-02-2016', "Match 9", "Dynamics", "Croods", "Vinaya and Prasad", "Kannan and Ashwin"]
    ]
  end

  def player_params
    params.require(:player).permit(:name, :score, :team_id, :image)
  end
end

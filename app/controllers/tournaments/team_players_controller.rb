module Tournaments
  class TeamPlayersController < ApplicationController
    before_action :current_tournament
    before_action :find_tournament_team
    before_action :find_team_player, only: [:edit, :update, :destroy]

    def index
      @team_players = @tournament_team.team_players
    end

    def new
      @team_player = @tournament_team.team_players.new
      @available_players = Player.available_players(@current_tournament)
    end

    def create
      @team_player = @tournament_team.team_players.new(team_player_params)

      respond_to do |format|
        if @team_player.save
          format.html { redirect_to tournaments_team_team_players_url(@tournament_team), notice: "Player was successfully assigned to team '#{@tournament_team.team_name}'." }
          format.json { render action: 'show', status: :created, location: @team_player }
        else
          format.html { render action: 'new' }
          format.json { render json: @team_player.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @team_player.update(team_player_params)
          format.html { redirect_to tournaments_team_team_players_url(@tournament_team), notice: 'Player was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @team_player.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @team_player.destroy

      respond_to do |format|
        format.html { redirect_to tournaments_team_team_players_url(@tournament_team), notice: 'Player was un-assigned!' }
        format.json { head :no_content }
      end
    end

    private

    def find_tournament_team
      @tournament_team = @current_tournament.tournament_teams.find params[:team_id]
    end

    def find_team_player
      @team_player = @tournament_team.team_players.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_player_params
      params.require(:team_player).permit(:player_id, :buy_price)
    end
  end

end
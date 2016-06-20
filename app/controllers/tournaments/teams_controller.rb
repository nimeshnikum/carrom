module Tournaments
  class TeamsController < ApplicationController
    before_action :current_tournament

    def index
      @teams = Team.all
      @tournament_teams = @current_tournament.tournament_teams
    end

    #TODO
    # def edit
    #   @tournament_team = @current_tournament.tournament_teams.find params[:id]
    # end

    def destroy
      @tournament_team = @current_tournament.tournament_teams.find params[:id]
      @tournament_team.destroy

      respond_to do |format|
        format.html { redirect_to tournaments_teams_url }
        format.json { head :no_content }
      end
    end

    def assign
      params[:tournament_team][:team_ids].reject {|id| id.blank?}.each do |team_id|
        team = Team.find team_id
        if team.present? && !@current_tournament.teams.include?(team)
          @current_tournament.teams << team
        end
      end

      redirect_to tournaments_teams_url
    end
  end

end
module TeamPlayersHelper
  def form_submit_path
    if @team_player.new_record?
      tournaments_team_team_players_path(@tournament_team)
    else
      tournaments_team_team_player_path(@tournament_team, @team_player)
    end
  end
end

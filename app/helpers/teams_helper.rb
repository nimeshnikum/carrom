module TeamsHelper

  def collection_for_teams
    Team.all.map {|t| [t.name, t.id]}
  end

  def for_team_display(team_name)
    ("for team <b>" + team_name + "</b>").html_safe
  end
end

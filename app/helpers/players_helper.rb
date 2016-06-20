module PlayersHelper
  def collection_for_players(players = [])
    players ||= Player.active
    players.map { |p| [p.name, p.id] }
  end
end

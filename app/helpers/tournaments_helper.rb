module TournamentsHelper

  def collection_for_tournaments
    Tournament.all.map {|t| [t.name, t.id]}
  end
end

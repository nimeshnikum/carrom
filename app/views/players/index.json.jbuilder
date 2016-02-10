json.array!(@players) do |player|
  json.extract! player, :id, :name, :score, :team_id, :image
  json.url player_url(player, format: :json)
end

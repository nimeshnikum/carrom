json.array!(@matches) do |match|
  json.extract! match, :id, :match_no, :match_date,, :team1_id,, :team2_id,, :winning_team_id,, :queen_team_id,, :comments
  json.url match_url(match, format: :json)
end

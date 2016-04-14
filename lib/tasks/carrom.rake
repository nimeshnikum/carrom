namespace :carrom do
  desc "Reset Carrom League"
  task :reset => :environment do
    Match.destroy_all
    puts "Match data cleared"
    MatchPlayer.destroy_all
    puts "Match Players data cleared"
    Player.all.each { |d| d.update_attributes(team_id: "", score: "")}
    puts "Players reset Auction pool"
  end
end

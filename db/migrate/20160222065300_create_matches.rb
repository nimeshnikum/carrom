class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :match_no
      t.string :match_date
      t.integer :team1_id
      t.integer :team2_id
      t.integer :winning_team_id
      t.integer :queen_team_id
      t.string :comments
      t.timestamps null: false
    end
  end
end

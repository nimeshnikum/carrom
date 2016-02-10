class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :score, :default => 1500
      t.timestamps null: false
    end
  end
end

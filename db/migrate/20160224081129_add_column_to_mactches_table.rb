class AddColumnToMactchesTable < ActiveRecord::Migration
  def change
    add_column :matches, :board_points, :integer
    add_column :matches, :comments, :string
  end
end

class AddCommentsIntoMatch < ActiveRecord::Migration
  def change
  	add_column :matches, :comments, :text
  end
end

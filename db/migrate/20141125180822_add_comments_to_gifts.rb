class AddCommentsToGifts < ActiveRecord::Migration
  def change
    add_column("gifts", "comments", :string, :limit => 225)
  end
end

class UpdateUsers < ActiveRecord::Migration
  def change
    add_column "users", "username", :string, :limit => 25
    add_column "users", "password", :string, :limit =>12
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", :limit => 25
      t.string "password", :limit => 12

      t.timestamps
    end
  end
end

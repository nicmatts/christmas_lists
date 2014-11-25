class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :url
      t.boolean :purchased

      t.references :person

      t.timestamps
    end
  end
end

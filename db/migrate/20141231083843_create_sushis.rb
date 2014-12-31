class CreateSushis < ActiveRecord::Migration
  def change
    create_table :sushis do |t|
      t.string :url
      t.string :provider

      t.timestamps null: false
    end
  end
end

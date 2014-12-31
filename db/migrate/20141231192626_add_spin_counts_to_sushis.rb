class AddSpinCountsToSushis < ActiveRecord::Migration
  def change
    add_column :sushis, :spin_counts, :integer
  end
end

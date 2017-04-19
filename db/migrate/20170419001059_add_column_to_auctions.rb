class AddColumnToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :end_at, :timestamp
  end
end

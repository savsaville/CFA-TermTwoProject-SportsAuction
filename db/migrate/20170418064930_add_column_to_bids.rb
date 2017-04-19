class AddColumnToBids < ActiveRecord::Migration[5.0]
  def change
    add_reference :bids, :auction, foreign_key: true
    add_column :bids, :value, :float
  end
end

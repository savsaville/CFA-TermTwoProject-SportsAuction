class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :sport, :string
    add_column :items, :charity, :string
    add_column :items, :sponsor, :string
  end
end

class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :starting_price
      t.datetime :end_time

      t.timestamps
    end
  end
end

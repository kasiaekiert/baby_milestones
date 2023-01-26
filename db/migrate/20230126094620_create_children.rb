class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.date :born_at

      t.timestamps
    end
  end
end

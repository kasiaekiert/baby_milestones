class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :child, null: false, foreign_key: true
      t.references :milestone, null: false, foreign_key: true

      t.timestamps
    end
  end
end

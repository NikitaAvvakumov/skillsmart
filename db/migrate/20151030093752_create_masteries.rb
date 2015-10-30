class CreateMasteries < ActiveRecord::Migration
  def change
    create_table :masteries do |t|
      t.string :description
      t.references :skill, index: true, foreign_key: true
      t.references :expert, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

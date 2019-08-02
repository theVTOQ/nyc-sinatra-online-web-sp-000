class CreateLandmarks < ActiveRecord::Migration[5.2]
  create_table :titles do |t|
    t.string :name
    t.integer :year_completed
    t.references :figure, index: true, foreign_key: true
  end
end

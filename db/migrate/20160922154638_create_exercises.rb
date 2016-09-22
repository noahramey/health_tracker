class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :burned_calories
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end

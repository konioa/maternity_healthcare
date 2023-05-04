class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.datetime :start_time, null: false
      t.string :title, null: false
      t.float :weight
      t.float :target_weight
      t.string :meal
      t.string :exercise
      t.string :condition
      t.string :disease
      t.string :diary
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

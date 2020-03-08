class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :evaluation, null: false
      # t.references :user_id, foreign_key: true
      t.text :evaluation_comment
      # t.references :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end

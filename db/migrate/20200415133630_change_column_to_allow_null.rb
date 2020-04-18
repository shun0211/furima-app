class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column_null :users, :credit_card_id, true # null: trueを明示する必要がある
  end

  # def down
  #   change_column_null :users, :credit_card_id, false
  # end
end

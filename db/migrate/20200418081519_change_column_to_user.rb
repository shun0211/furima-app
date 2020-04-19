class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :phone_number, :string, presence: true, length: { maximum: 11 }
  end
end

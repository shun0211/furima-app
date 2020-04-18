class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phone_number, :string, presence: true, length: { maximum: 11 }
  end
end

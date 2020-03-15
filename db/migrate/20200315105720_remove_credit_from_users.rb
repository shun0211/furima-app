class RemoveCreditFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :credit
  end
end

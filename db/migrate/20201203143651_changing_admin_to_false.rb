class ChangingAdminToFalse < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :admin, default: false
  end
end

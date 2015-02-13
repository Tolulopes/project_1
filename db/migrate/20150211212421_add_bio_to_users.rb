class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Bio, :text
  end
end

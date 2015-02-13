class RenameBioColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :Bio, :bio
  end
end

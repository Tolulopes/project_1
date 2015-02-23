class RemoveProducerIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :producer_id
  end
end

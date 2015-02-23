class RemoveProducersTable < ActiveRecord::Migration
  def change
    drop_table :producers
  end
end

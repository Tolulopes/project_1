class AddTrackIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :track_id, :integer
  end
end

class AddIndexToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_index(:follows, [:followerid, :followedid], unique: true)
  end
end

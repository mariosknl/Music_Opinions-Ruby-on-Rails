class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :followerid
      t.integer :followedid

      t.timestamps
    end
  end
end

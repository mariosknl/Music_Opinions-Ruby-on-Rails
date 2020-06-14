class AddOpinionIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :opinion_id, :integer
  end
end

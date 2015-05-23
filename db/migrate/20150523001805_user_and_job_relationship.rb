class UserAndJobRelationship < ActiveRecord::Migration
  def change
    add_column :jobs, :user_id, :integer, index: true
  end
end

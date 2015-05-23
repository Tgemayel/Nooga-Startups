class UserAndJobRelationship < ActiveRecord::Migration
  def change
    add_column :jobs, :user_id, :belongs_to, index: true
  end
end

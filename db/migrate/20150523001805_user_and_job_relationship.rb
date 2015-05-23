class UserAndJobRelationship < ActiveRecord::Migration
  def change
    add_column :jobs, :user, :belongs_to
  end
end

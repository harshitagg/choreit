class AddGroupIdColumnToChores < ActiveRecord::Migration
  def change
    add_column :chores, :group_id, :string
  end
end

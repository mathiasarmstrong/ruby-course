class ChangeCommentsTable < ActiveRecord::Migration
  def change
    remove_reference :comments, :video
    add_reference :comments, :user, index: true
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end


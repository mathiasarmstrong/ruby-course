class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.references :video, index: true

      t.timestamps
    end
  end
end

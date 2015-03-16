class AddSerializationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :serial_email, :text
  end
end

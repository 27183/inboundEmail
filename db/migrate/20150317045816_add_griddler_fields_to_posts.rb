class AddGriddlerFieldsToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :email, :string

    rename_column :posts, :serial_email, :headers

    add_column :posts, :to, :text
    add_column :posts, :from, :text
    add_column :posts, :cc, :text
    add_column :posts, :subject, :text
    add_column :posts, :raw_text, :text
    add_column :posts, :raw_html, :text
    add_column :posts, :raw_body, :text
    add_column :posts, :attachments, :text
    add_column :posts, :raw_headers, :text
  end
end

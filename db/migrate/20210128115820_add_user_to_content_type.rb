class AddUserToContentType < ActiveRecord::Migration[6.0]
  def change
    add_reference :content_types, :user, null: true, foreign_key: true
  end
end

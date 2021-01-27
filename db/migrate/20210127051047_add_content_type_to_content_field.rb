class AddContentTypeToContentField < ActiveRecord::Migration[6.0]
  def change
    add_reference :content_fields, :content_type, null: false, foreign_key: true
  end
end

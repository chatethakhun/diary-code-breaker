class AddFieldTypeToContentField < ActiveRecord::Migration[6.0]
  def change
    add_column :content_fields, :field_type, :string
  end
end

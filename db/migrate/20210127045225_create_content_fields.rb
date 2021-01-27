class CreateContentFields < ActiveRecord::Migration[6.0]
  def change
    create_table :content_fields do |t|
      t.string :field_name
      t.string :placeholder
      t.boolean :require

      t.timestamps
    end
  end
end

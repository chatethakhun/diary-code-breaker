class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.belongs_to :content_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

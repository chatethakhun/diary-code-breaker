class AddPropertiesToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :properties, :text
  end
end

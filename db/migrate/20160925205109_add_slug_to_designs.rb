class AddSlugToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :slug, :string
    add_index :designs, :slug, unique: true
  end
end

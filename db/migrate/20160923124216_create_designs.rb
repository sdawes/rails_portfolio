class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :img_name
      t.string :caption

      t.timestamps
    end
  end
end

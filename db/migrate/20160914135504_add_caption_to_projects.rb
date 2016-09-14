class AddCaptionToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :caption, :string
  end
end

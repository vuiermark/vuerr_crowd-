class AddImageAndVideoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image_file_name, :string
    add_column :projects, :video, :string
  end
end

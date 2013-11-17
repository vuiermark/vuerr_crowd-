class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :monthly_funding_goal, :decimal
    add_column :projects, :long_description, :text
  end
end

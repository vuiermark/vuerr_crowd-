class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :youtube_channel
      t.string :title
      t.string :description
      t.string :country
      t.string :city
      t.decimal :funding_goal
      t.date :deadline

      t.timestamps
    end
  end
end

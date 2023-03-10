class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.string :project_id

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.string :id_task
      t.timestamp :created
      t.string :status
      t.string :priority
      t.string :created_by
      t.date :resolution

      t.timestamps
    end
  end
end

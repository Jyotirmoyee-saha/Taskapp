class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :tname
      t.boolean :tno
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

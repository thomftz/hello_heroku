class TasksTable < ActiveRecord::Migration[5.0]
  def up
    puts 'creating tasks table'

    create_table :tasks do |t|
      t.string :name
      t.integer :priority
      t.boolean :status
      t.timestamps
      t.belongs_to :project
    end

    puts 'created tasks table'
  end

  def down
    puts 'dropping tasks table'

    drop_table :tasks

    puts 'dropped tasks table'
  end
end

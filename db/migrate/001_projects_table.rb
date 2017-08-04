class ProjectsTable < ActiveRecord::Migration[5.0]
  def up
    puts 'creating projects table'

    create_table :projects do |t|
      t.string :name
      t.string :status
      t.timestamps
    end

    puts 'created projects table'
  end

  def down
    puts 'dropping projects table'

    drop_table :projects

    puts 'dropped projects table'
  end
end

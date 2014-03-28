class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :chore_id
      t.string :title
      t.string :description
      t.datetime :due_date
      t.boolean :is_done

      t.timestamps
    end
  end
end

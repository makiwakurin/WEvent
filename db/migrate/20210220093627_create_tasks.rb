class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string      :name, null: false, default: ""
      t.text        :description
      t.references  :user, null: false, foreign_key: true
      t.references  :event, null: false, foreign_key: true
      t.date        :deadline
      t.timestamps
    end
  end
end

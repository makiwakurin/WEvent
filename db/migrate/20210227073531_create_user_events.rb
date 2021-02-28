class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.references :user,       foreign_key: true
      t.references :event,      foreign_key: true
      # t.integer    :status_id,  null: false
      t.timestamps
    end
  end
end
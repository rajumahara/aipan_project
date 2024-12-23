class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.text :user_agent
      t.string :remote_ip

      t.timestamps
    end
  end
end

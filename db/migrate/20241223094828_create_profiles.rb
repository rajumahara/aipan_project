class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :state
      t.string :pin_code

      t.timestamps
    end
  end
end

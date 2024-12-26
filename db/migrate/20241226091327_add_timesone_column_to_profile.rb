class AddTimesoneColumnToProfile < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :timezone, :string
  end
end

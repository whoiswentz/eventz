class AddStartAtAndDescriptionToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :starts_at, :datetime
    add_column :events, :description, :string
  end
end

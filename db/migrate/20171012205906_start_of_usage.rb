class StartOfUsage < ActiveRecord::Migration[5.1]
  def change
    add_column :indicators, :start_of_occupation, :datetime, default: nil
  end
end

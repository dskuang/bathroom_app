class AddDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :indicators, :status, :boolean, default: false
  end
end

class CreateIndicator < ActiveRecord::Migration[5.1]
  def change
    create_table :indicators do |t|
      t.timestamps
      t.boolean 'status'
    end
  end
end

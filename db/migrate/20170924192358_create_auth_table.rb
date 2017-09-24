class CreateAuthTable < ActiveRecord::Migration[5.1]
  def change
    create_table :request_tokens do |t|
      t.string 'authentication'
      t.timestamps
    end
  end
end

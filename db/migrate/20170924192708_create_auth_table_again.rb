class CreateAuthTableAgain < ActiveRecord::Migration[5.1]
  def change
    create_table :request_tokens do |t|
      t.timestamps
      t.string 'authentication'
    end
  end
end

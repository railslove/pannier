class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 15
      t.string :password, null: false
      t.string :email, limit: 40

      t.timestamps
    end
  end
end

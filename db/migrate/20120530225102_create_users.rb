class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :encoded_password

      t.timestamps
    end
  end
end

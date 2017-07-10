class SorceryCore < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :username
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps                :null => false
    end

    add_index :authors, :email, unique: true
  end
end

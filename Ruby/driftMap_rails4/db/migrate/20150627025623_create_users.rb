class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: true, unique: true
      t.string :gps
      t.string :from
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, default: false
      t.boolean :activated, default: false
      t.string :activation_digest
      t.datetime :activated_at
      t.string :profile_pic
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps null: false
    end
  end
end
class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
    
    create_table :books do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "borrowed"
      t.datetime :key_timestamp
    end
  end

  def self.down
    drop_table :users
    drop_table :books
  end
end

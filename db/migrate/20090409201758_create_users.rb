class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :facebook_id, :limit => 20 
      t.string :facebook_session_key

      t.timestamps
    end
    add_index :users, :facebook_id, :uniq => true
  end

  def self.down
    drop_table :users
  end
end

class CreateIdeeliHashes < ActiveRecord::Migration
  def self.up
    create_table :db_hashes do |t|
      t.string :hkey
      t.string :hvalue
    end
    
    add_index :db_hashes, :hkey
  end

  def self.down
    drop_table :db_hashes
  end
end

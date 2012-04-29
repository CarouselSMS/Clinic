class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.string    'title',        :default => ''
      t.string    'phone_number', :size => 20, :null => false
      t.boolean   'active',       :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :conversations
  end
end

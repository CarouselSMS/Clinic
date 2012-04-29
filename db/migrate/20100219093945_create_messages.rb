class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer  "conversation_id",                   :null => false
      t.string   "body",                              :null => false
      t.boolean  "incoming",      :default => false,  :null => false
      t.boolean  "read",          :default => false,  :null => false
      t.timestamps
    end

    add_index :messages, ["conversation_id"]
  end

  def self.down
    drop_table :messages
  end
end

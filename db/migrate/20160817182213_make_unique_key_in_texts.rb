class MakeUniqueKeyInTexts < ActiveRecord::Migration
  def change
    add_index :texts, :key, unique: true
  end
end

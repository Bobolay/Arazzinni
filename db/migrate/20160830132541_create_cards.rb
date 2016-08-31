class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.boolean :published, null: false, index: true, default: 'f'
      t.string :category

      t.timestamps null: false
    end
  end
end

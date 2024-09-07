class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id

      t.timestamps
    end
  end
end

class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :movie, null: false, foreign_key: { on_delete: :restrict }
      t.references :list, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end

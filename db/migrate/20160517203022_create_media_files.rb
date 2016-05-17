class CreateMediaFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :media_files do |t|
      t.integer :tweet_id, null: false

      t.string :link, null: false
      t.string :media_type

      t.timestamps null: false
    end

    add_index :media_files, :tweet_id
    add_index :media_files, :media_type

  end
end

class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.integer :tweet_id, null: false
      t.integer :twitter_id, null: false

      t.string :link, null: false
      t.string :text
      t.string :media_type

      t.timestamps null: false
    end

    add_index :tweets, :tweet_id, unique: true
    add_index :tweets, :media_type
    add_index :tweets, :user_id
    add_index :tweets, :twitter_id
  end
end

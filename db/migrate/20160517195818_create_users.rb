class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      # Twitter
      t.string  :screen_name, null: false
      t.integer :twitter_id, null: false, limit: 8
      t.string  :name, null: false, default: "A bird"
      t.string  :profile_img, null: false, default: "https://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png"

      t.integer :admin, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :twitter_id, unique: true
    add_index :users, :screen_name, unique: true
    add_index :users, :email, unique: true
  end
end

class CreateTweetAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet_admin_users do |t|
      t.string :name
      t.string :consumer_key
      t.string :consumer_secret
      t.string :access_token
      t.string :access_token_secret

      t.timestamps
    end
  end
end

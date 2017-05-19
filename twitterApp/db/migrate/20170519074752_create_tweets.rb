class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :tweet_text
      t.datetime :tweet_create_at

      t.timestamps
    end
  end
end

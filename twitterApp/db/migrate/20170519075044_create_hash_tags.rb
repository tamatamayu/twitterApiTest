class CreateHashTags < ActiveRecord::Migration[5.0]
  def change
    create_table :hash_tags do |t|
      t.text :hash_tag_text
      t.integer :tweet_id

      t.timestamps
    end
  end
end

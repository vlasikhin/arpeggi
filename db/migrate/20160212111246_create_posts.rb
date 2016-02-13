class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :caption
      t.text :article

      t.timestamps null: false
    end
  end
end

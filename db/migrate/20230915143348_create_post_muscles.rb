class CreatePostMuscles < ActiveRecord::Migration[6.0]
  def change
    create_table :post_muscles do |t|
      t.references :post, null: false,foreign_key: true
      t.integer :muscle, foreign_key: true
      t.timestamps
    end
  end
end

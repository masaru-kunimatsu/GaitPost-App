class CreatePostJoints < ActiveRecord::Migration[6.0]
  def change
    create_table :post_joints do |t|
      t.references :post, null: false,foreign_key: true
      t.integer :joint, foreign_key: true
      t.timestamps
    end
  end
end

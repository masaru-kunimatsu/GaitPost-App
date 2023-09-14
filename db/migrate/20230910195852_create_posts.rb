class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.text :literature, null: false
      t.integer :walkcycle_id, null: false
      t.integer :muscle_id
      t.integer :joint_id
      t.integer :neuron_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreatePostWalkcycles < ActiveRecord::Migration[6.0]
  def change
    create_table :post_walkcycles do |t|
      t.references :post, null: false,foreign_key: true
      t.integer :walkcycle, null: false, default: 0, foreign_key: true
      t.timestamps
    end
  end
end

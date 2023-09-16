class CreatePostWalkcycles < ActiveRecord::Migration[6.0]
  def change
    create_table :post_walkcycles do |t|

      t.timestamps
    end
  end
end

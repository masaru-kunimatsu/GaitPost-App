class RenameCycleIdColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :cycle_id, :walkcycle_id
  end
end

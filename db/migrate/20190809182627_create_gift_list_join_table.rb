class CreateGiftListJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :lists, :gifts do |t|
      t.index :list_id
      t.index :gift_id
    end
  end
end
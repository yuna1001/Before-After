class CreateBeforeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :before_images do |t|
    	t.integer :post_id, null: false
      t.string :before_postimage_id, null: false
      t.timestamps
    end
  end
end

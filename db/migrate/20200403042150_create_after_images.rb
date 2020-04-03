class CreateAfterImages < ActiveRecord::Migration[5.2]
  def change
    create_table :after_images do |t|
    	t.integer :post_id, null: false
      t.string :after_postimage_id, null: false
      t.timestamps
    end
  end
end

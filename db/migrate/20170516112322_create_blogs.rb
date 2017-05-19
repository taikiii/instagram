class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :content
      t.string :photo_image

      t.timestamps null: false
    end
  end
end

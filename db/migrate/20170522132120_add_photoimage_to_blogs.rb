class AddPhotoimageToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :photoimage, :string
  end
end

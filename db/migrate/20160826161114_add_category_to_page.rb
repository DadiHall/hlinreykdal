class AddCategoryToPage < ActiveRecord::Migration
  def change
  	category = Category.create! name: "No category"
    add_reference :pages, :category, index: true, foreign_key: true, default: category.id
  end
end

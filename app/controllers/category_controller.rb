class CategoryController < ApplicationController

  def get_categories
    render json: Category.select(:id, :code, :description)
  end

end

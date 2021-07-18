class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: { status: 201 }
    else
      render json: { status: 422, errors: @category.errors.full_messages }
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end

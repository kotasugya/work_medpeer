class IdeasController < ApplicationController
  def create
    category_name = Category.find_by(name: params[:category_name])
    # カテゴリー名がある場合
    if category_name
      category_id = category_name.id
      idea = Idea.create(idea_params.merge(category_id: category_id))
    # カテゴリー名が無い場合
    else
      category = Category.create(name: params[:category_name])
      idea = Idea.create(idea_params.merge(category_id: category.id))
    end
    if idea
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def index
    if params[:category_name]
      category_name = Category.find_by(name: params[:category_name])
      if category_name
        ideas = Idea.joins(:category).
          select("ideas.id, categories.name, ideas.body, ideas.created_at").
          where(category_id: category_name.id)
      end
    else
      ideas = Idea.joins(:category).select("ideas.id, categories.name, ideas.body, ideas.created_at")
    end
    if ideas
      render json: { ideas: ideas }
    else
      render status: :not_found
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:body)
  end
end

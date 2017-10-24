class RecipesController < ApplicationController
  def index
    @search_term = params[:search] || "chocolate"
    @recipes_list = Recipe.for(@search_term)
  end
end

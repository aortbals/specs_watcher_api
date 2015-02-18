class CategoriesController < ApplicationController
  before_action :execute_search, only: :show

  def index
    render json: SpecsWatcher::Searcher.sub_categories.keys
  end

  def show
    render json: @results
  end

  private

  def execute_search
    @results = SpecsWatcher::Searcher.search(category: id, format: 'json')
  end

  def id
    params.require(:id)
  end
end

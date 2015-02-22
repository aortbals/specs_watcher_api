class CategoriesController < ApplicationController
  before_action :execute_search, only: :show

  def index
    render json: SpecsWatcher::Searcher.sub_categories.keys
  end

  def show
    render json: items
  end

  private

  def results
    @results.map {|r|
      {
        key: r,
        title: r.titleize
      }
    }
  end

  def execute_search
    @results = SpecsWatcher::Searcher.search(category: id, format: 'json')
  end

  def id
    params.require(:id)
  end
end

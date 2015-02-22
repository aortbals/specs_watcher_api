class CategoriesController < ApplicationController
  before_action :execute_search, only: :show

  def index
    render json: categories
  end

  def show
    render json: items
  end

  private

  def categories
    SpecsWatcher::Searcher.sub_categories.keys.map {|r|
      {
        key: r,
        title: r.to_s.titleize
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

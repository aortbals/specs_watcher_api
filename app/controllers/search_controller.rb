class SearchController < ApplicationController
  before_action :execute_search, only: :index

  def index
    render json: items
  end

  private

  def execute_search
    @results = SpecsWatcher::Searcher.search(keyword: q, format: 'json')
  end

  def q
    params.require(:q)
  end
end

class SearchController < ApplicationController
  before_action :search, only: :index

  def index
    render json: @results
  end

  private

  def search
    @results = SpecsWatcher::Searcher.search(keyword: index_params, format: 'json')
  end

  def index_params
    params.require(:q)
  end
end

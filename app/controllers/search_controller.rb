class SearchController < ApplicationController
  before_action :execute_search, only: :index

  def index
    render json: results
  end

  private

  def results
    @results.map { |r|
      r[:title] = r[:title].titleize
      r[:description] = r[:description].capitalize
      r
    }
  end

  def execute_search
    @results = SpecsWatcher::Searcher.search(keyword: q, format: 'json')
  end

  def q
    params.require(:q)
  end
end

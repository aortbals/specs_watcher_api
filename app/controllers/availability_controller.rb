class AvailabilityController < ApplicationController
  before_action :get_availability, only: :index

  def index
    render json: @results
  end

  private

  def get_availability
    @results = SpecsWatcher::Availability.search(zip: zip, upc: upc)
  end

  def zip
    params.require(:zip)
  end

  def upc
    params.require(:upc)
  end
end

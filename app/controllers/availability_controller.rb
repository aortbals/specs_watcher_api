require_relative '../models/locations'

class AvailabilityController < ApplicationController
  before_action :get_availability, only: :index

  def index
    render json: location_results
  end

  private

  def location_results
    {
      title: @results[:title],
      locations: @results[:locations].map {|l|
        l.merge(store_details: store_details(l[:store_name]))
      }
    }
  end

  def store_details(name)
    locations[name.split("-").first]
  end

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

class HotelsController < ApplicationController
    def index
      @hotels = Hotel.all
      @locations = Hotel.pluck(:location).uniq
    end
  end
  
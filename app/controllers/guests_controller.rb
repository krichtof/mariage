class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end
end

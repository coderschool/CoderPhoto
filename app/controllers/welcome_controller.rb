class WelcomeController < ApplicationController
  def index
  end

  def api
    @photos = Photo.all
  end
end

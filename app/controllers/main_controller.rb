class MainController < ApplicationController
  def index
  end

  def host
    render json: { host: request.host }
  end
end

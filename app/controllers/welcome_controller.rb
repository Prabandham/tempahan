class WelcomeController < ApplicationController
  def index
    render json: { status: 'success', message: 'Up and Running' }
  end
end

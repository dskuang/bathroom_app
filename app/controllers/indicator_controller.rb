class IndicatorController < ApplicationController
  before_action :authenticate_request, only: [:occupied, :vacant]

  def index
    @indicator = indicator
    @status = indicator.status
  end

  def occupied
    @indicator = indicator
    indicator.occupied!
    @status = indicator.status
    broadcast_status
    render 'index'
  end

  def vacant
    @indicator = indicator
    indicator.vacant!
    @status = indicator.status
    broadcast_status
    render 'index'
  end

  private

  def indicator
    @indicator ||=
      Indicator.last || Indicator.create!
  end

  def broadcast_status
    ActionCable.server.broadcast('updates', status: @status)
  end

  def authenticate_request
    indicator_options[:key] == auth_token
  end

  def auth_token
    RequestToken.last.authentication
  end

  def indicator_options
    params.require(:options).permit(:key)
  end
end

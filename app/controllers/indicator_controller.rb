class IndicatorController < ApplicationController
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
end

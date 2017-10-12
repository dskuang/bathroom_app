class IndicatorController < ApplicationController
  before_action :authenticate_request, only: [:occupied, :vacant]

  def index
    @status = indicator.status
  end

  def occupied
    indicator.occupied!(start_of_occupation)
    @status = indicator.status
    @time = parse_time
    broadcast_status
    render 'index'
  end

  def vacant
    indicator.vacant!
    @status = indicator.status
    @time = parse_time
    broadcast_status
    render 'index'
  end

  private

  def indicator
    @indicator ||= Indicator.last || Indicator.create!
  end

  def parse_time
    indicator.start_of_occupation.try(:strftime, '%m/%d/%Y %I:%M%p')
  end

  def broadcast_status
    ActionCable.server.broadcast('updates', status: @status, time: @time)
  end

  def authenticate_request
    params[:key] == auth_token
  end

  def auth_token
    RequestToken.last.authentication
  end

  def start_of_occupation
    Time.strptime(params[:time], '%Y-%m-%d %k:%M:%S %Z') if params[:time].present?
  end
end

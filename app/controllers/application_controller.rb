class ApplicationController < ActionController::Base
  def params
    super.to_unsafe_h.with_indifferent_access
  end
end

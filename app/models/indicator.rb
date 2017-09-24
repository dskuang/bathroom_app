class Indicator < ApplicationRecord
  def occupied!
    update_attributes!(status: true)
  end

  def vacant!
    update_attributes!(status: false)
  end
end

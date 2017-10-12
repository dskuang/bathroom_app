class Indicator < ApplicationRecord
  def occupied!(time)
    update_attributes!(status: true, start_of_occupation: time)
  end

  def vacant!
    update_attributes!(status: false, start_of_occupation: nil)
  end
end

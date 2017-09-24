module ApplicationHelper
  def bathroom_background_color
    @status ? 'red' : 'green'
  end
end

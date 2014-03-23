module ApplicationHelper
  def readable_date(d)
      d = d.to_date unless d.is_a?(Date)
      d.readable_inspect
  end
end

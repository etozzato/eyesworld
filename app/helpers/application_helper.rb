# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def money(value)
    content_tag :span, number_to_currency(value), :class => "#{value > 0 ? 'positive' : 'negative'}"
  end
  
end

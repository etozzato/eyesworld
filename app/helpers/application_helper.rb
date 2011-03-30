# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def sh_date(date)
    date.strftime('%d/%m/%Y')
  end
  
  def money(value)
    content_tag :span, number_to_currency(value), :class => "#{value > 0 ? 'positive' : 'negative'}"
  end
  
  def euro(val)
    number_to_currency(val, :unit => '&euro; ')
  end
  
end

module ApplicationHelper
  def nbsp
    "&nbsp;".html_safe
  end

  def body_id
    "#{controller.controller_name}_#{controller.action_name}"
  end


	def show_hours_estimated?(user=nil)
		return false if current_user.blank?
		return false if body_id == 'requests_show'
		return true  if body_id == 'price_quotes_new'
		return true  if	current_user == @price_quote.user rescue false
	end

	
end

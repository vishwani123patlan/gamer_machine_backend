module ApplicationHelper
  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        return object.errors.messages[field_name].first
      end
    end
  end 
end
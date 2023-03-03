module ApplicationHelper
  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        return object.errors.messages[field_name].first
      end
    end
  end

  def link_to_add_fields(name, f, association, locals={})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "#{locals[:class]}", data: {id: id, fields: fields.gsub("\n", "")})
  end
end

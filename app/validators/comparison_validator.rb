class ComparisonValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    comparison_attr = options[:comparison_attr]
    comparison_value = record.send(comparison_attr)
    comparison_operator = options[:operator] || :>

    if value.present? && comparison_value.present?
      unless value.send(comparison_operator, comparison_value)
        record.errors.add(attribute, (options[:message] || "must be #{comparison_operator.to_s.gsub('_', ' ')} #{comparison_attr}"))
      end
    end
  end
end
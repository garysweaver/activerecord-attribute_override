require "activerecord-attribute_override/version"

# monkey-patch ActiveRecord::Base
module ActiveRecord
  class Base
    def override_attribute(attr_name, value, environments = [])
      # raise error for common method naming issue to point users in right direction
      raise "Cannot 'override_attribute' with hash as the attribute name. Use 'override_attributes' instead." if attr_name.is_a?(Hash)
      environments = [environments] if !environments.is_a?(Array)      
      if environments.empty? || environments.collect{|e|e.to_sym}.include?(Rails.env.to_sym)
        instance_variable_set("@#{attr_name}".to_sym, value)
        instance_eval "def #{attr_name}; @#{attr_name}; end"
      end
    end

    def override_attributes(attr_name_to_value_map, environments = [])
      environments = [environments] if !environments.is_a?(Array)      
      if environments.empty? || environments.collect{|e|e.to_sym}.include?(Rails.env.to_sym)
        attr_name_to_value_map.keys.each do |attr_name|
          instance_variable_set("@#{attr_name}".to_sym, attr_name_to_value_map[attr_name])
          instance_eval "def #{attr_name}; @#{attr_name}; end"
        end
      end
    end
  end
end

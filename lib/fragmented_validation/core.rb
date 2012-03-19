module FragmentedValidation
  module Core
    def self.included(base)
      base.extend ClassMethods
    end
  end
  
  module ClassMethods
    def fragmented_validation
      include InstanceMethods
      attributes = self.new.attributes.keys
      attributes.each do |key|
        define_method "valid_#{key}?" do
          fragmented_validation_on key
        end
      end
    end
  end

  module InstanceMethods
    def fragmented_validation_on(*attrs)
      fragmented_validation(attrs)
    end

    def fragmented_validation_except(*attrs)
      fragmented_validation(attributes.keys - attrs.map{|att| att.to_s})
    end

    def fragmented_validation(*attrs)
      valid?
      _errors = {}
      attrs.flatten.uniq.each do |attr|
        _errors[attr] =  errors[attr]
      end

      errors.clear
      _errors.each_pair do |key, values|
        values.each do |val|
          errors.add(key, val)
        end
      end

      errors.empty?
    end
  end

end

module FragmentedValidation
  module Core
    def self.included(base)
      base.class_eval do
        include InstanceMethods
        attributes = self.new.attributes.keys
        attributes.each do |key|
          define_method "valid_#{key}?" do
            frag_valid_on key
          end
        end
      end
    end
  end

  module InstanceMethods
    def frag_valid_on(*attrs)
      frag_validation(attrs)
    end

    def frag_valid_except(*attrs)
      frag_validation(attributes.keys - attrs)
    end

    def frag_validation(*attrs)
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

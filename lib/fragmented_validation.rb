require 'active_record'
require "fragmented_validation/version"
require 'fragmented_validation/core'

ActiveRecord::Base.send(:include, FragmentedValidation::Core)
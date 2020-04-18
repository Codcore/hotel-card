require 'reform'
require 'reform/form/dry'
require 'dry-types'

Reform::Form.class_eval do
  include Reform::Form::Dry
end

module Types
  include Dry::Types()
end

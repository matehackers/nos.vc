class DynamicValue < ActiveRecord::Base
  belongs_to :dynamic_field
  belongs_to :backer
  attr_accessible :value
end

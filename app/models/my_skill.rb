class MySkill
  include Mongoid::Document
  embedded_in :user
  field :name

  attr_accessible  :name
end

class WantedSkill
  include Mongoid::Document
  embedded_in :user
  field :sname
  attr_accessible  :sname
end


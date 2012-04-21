class WantedSkill
  include Mongoid::Document
  embedded_in :user
  field :sname
end


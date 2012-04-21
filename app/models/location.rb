class Location 
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  embedded_in :user

  field :address

  field :coordinates, :type => Array

  geocoded_by :address              
  
  after_validation :geocode 

  attr_accessible :address, :coordinates

end

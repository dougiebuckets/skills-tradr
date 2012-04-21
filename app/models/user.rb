class User
  include Mongoid::Document
  include Geocoder::Model::Mongoid


  embeds_many :wanted_skills
  embeds_many :my_skills
  accepts_nested_attributes_for :my_skills, allow_destroy: true
  accepts_nested_attributes_for :wanted_skills, allow_destroy: true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :null => false, :default => ""
  field :encrypted_password, :type => String, :null => false, :default => ""
  


  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String


  field :first_name
  field :last_name
  field :address 

  field :coordinates, :type => Array

  geocoded_by :address              
  
  after_validation :geocode 
  #geocoded_by :address  
  #after_validation :geocode    
  #field :coordinates, :type => Array


  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :first_name, :last_name, :email, :case_sensitive => false
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :address, :coordinates, :my_skills_attributes, :coordinates, :wanted_skills_attributes, :name, :sname
  ## Encryptable
  # field :password_salt, :type => String

  
  ##Geocoding
  #geocoded_by :place
  #after_validation :fetch_coordinates
  #after_validation :set_label

  #reverse_geocoded_by :latitude, :longitude
  #after_validation :fetch_address


##this will reverse so it will shorten from the address just to city
  #reverse_geocoded_by :lat, :lon do |obj,geo|
   # obj.city    = geo.city
    #obj.zipcode = geo.postal_code
    #obj.country = geo.country_code
  #end
  #after_validation :reverse_geocode
  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

end
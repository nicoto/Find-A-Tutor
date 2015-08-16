class Location < ActiveRecord::Base
  has_many :needs
  has_many :users
  has_many :events
end

class Location < ActiveRecord::Base
  has_many :needs
  has_many :users # how does this work?
  has_many :events
end

class Location < ActiveRecord::Base
  belongs_to :need
  has_many :events
  belongs_to :need
end

class Location < ActiveRecord::Base
  belongs_to :need
  belongs_to :event
  belongs_to :need
end

class Event < ActiveRecord::Base

  has_and_belongs_to_many :user
  belongs_to :location
  belongs_to :subject
  belongs_to :group
  has_many :comments
end

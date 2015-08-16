class Need < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_one :location
end

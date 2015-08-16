class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  has_and_belongs_to_many :subjects
  has_many :comments
  has_many :needs

end

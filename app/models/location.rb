# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  street     :string
#  suite      :string
#  city       :string
#  state      :string
#  zip        :string
#  name       :string
#  phone      :string
#  contact    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  has_many :needs
  has_many :users
  has_many :events
end

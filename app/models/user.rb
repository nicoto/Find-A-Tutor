# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  username      :string
#  password_hash :string
#  role          :integer
#  grade         :string
#  school        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  include Taggable

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  has_and_belongs_to_many :subjects
  has_many :comments
  has_many :needs

end

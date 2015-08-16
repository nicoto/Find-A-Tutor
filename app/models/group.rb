# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base

  # has_and_belongs_to_many :users, join_table: 'members'
  has_many :members
  has_many :users, through: :members
  has_many :events
end

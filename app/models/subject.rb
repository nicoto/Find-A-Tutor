# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ActiveRecord::Base

  has_and_belongs_to_many :users, join_table: 'studies'

  has_many :events
  has_many :needs
end

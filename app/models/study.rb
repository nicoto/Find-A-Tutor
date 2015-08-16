# == Schema Information
#
# Table name: studies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Study < ActiveRecord::Base
  has_many :events
end

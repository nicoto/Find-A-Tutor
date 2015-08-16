# == Schema Information
#
# Table name: needs
#
#  id          :integer          not null, primary key
#  description :text
#  subject_id  :integer
#  user_id     :integer
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Need < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_one :location
end

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  attendees   :integer
#  time_start  :date
#  time_end    :date
#  description :text
#  subject_id  :integer
#  user_id     :integer
#  location_id :integer
#  group_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  include Taggable


  has_and_belongs_to_many :user, join_table: "happenings"
  belongs_to :location
  belongs_to :subject
  belongs_to :group
  has_many :comments
end

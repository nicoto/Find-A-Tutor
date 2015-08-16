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

  include BCrypt

  has_and_belongs_to_many :groups, join_table: 'members'
  # has_and_belongs_to_many :events, join_table: 'happenings'
  has_and_belongs_to_many :subjects, join_table: 'studies'

  has_many :happenings
  has_many :events, through: :happenings, source: :event
  has_many :created_events, class: "Event", foreign_key: :user_id

  has_many :comments
  has_many :needs

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password ||= Password.create(pass)
    self.password_hash = @password
  end
end

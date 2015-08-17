# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  username      :string
#  role          :integer
#  grade         :string
#  school        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  validates :password, presence: { message: "Password can't be blank" }

  has_many :members
  has_many :groups, through: :members
  has_and_belongs_to_many :subjects, join_table: 'studies'

  has_many :happenings
  has_many :events, through: :happenings, source: :event
  has_many :created_events, class: "Event", foreign_key: :user_id

  has_many :comments
  has_many :needs

# how you log a registered user in

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end

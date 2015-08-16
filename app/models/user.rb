class User < ActiveRecord::Base
  include BCrypt
  has_and_belongs_to_many :groups, join_table: 'members'
  has_and_belongs_to_many :events, join_table: 'happenings'
  has_and_belongs_to_many :subjects, join_table: 'studies'
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

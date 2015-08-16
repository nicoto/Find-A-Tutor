class User < ActiveRecord::Base

  attr_reader :password

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_hash, presence: { message: "Password can't be blank" }
  after_initialize :ensure_session_token

  has_and_belongs_to_many :groups, join_table: 'members'
  has_and_belongs_to_many :events, join_table: 'happenings'
  has_and_belongs_to_many :subjects, join_table: 'studies'
  has_many :comments
  has_many :needs

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    if @user && @user.is_password?(password)
      return @user
    end
    nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
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

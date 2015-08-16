class User < ActiveRecord::Base
  has_and_belongs_to_many :groups, join_table: 'members'
  has_and_belongs_to_many :events, join_table: 'happenings'
  has_and_belongs_to_many :subjects, join_table: 'studies'
  has_many :comments
  has_many :needs

end

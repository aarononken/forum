# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  username           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  admin              :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  has_many :topics
  has_many :convos
  has_many :comments

  def password
  	nil # So we never show our actual password to the outside world
  end

  def password=(new_password)
  	self.encrypted_password = BCrypt::Password.create(new_password)
  end

  def authentic?(plaintext_password)
  	BCrypt::Password.new(encrypted_password) == plaintext_password
  end
end

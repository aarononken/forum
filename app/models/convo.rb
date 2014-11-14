# == Schema Information
#
# Table name: convos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  topic_id   :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Convo < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :comments
end

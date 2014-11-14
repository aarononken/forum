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

require 'test_helper'

class ConvoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  content    :text             not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
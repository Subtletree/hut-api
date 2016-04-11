# == Schema Information
#
# Table name: intentions
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  user_id                :integer
#  participants           :text             default([]), is an Array
#  number_of_participants :integer          not null
#  emergency_name         :string           not null
#  emergency_number       :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  start_date             :date             not null
#  end_date               :date             not null
#

require 'test_helper'

class IntentionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

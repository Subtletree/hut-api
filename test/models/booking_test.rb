# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  booking_type :string           not null
#  hut_id       :integer
#  intention_id :integer
#  comment      :string
#  date         :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

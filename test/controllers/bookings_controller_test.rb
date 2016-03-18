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

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post bookings_url, params: { booking: { booking_type: @booking.booking_type, comment: @booking.comment, date: @booking.date, hut_id: @booking.hut_id, intention_id: @booking.intention_id } }
    end

    assert_response 201
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { booking_type: @booking.booking_type, comment: @booking.comment, date: @booking.date, hut_id: @booking.hut_id, intention_id: @booking.intention_id } }
    assert_response 200
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end

    assert_response 204
  end
end

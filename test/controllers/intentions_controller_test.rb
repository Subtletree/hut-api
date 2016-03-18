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
#

require 'test_helper'

class IntentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intention = intentions(:one)
  end

  test "should get index" do
    get intentions_url
    assert_response :success
  end

  test "should create intention" do
    assert_difference('Intention.count') do
      post intentions_url, params: { intention: { emergency_name: @intention.emergency_name, emergency_number: @intention.emergency_number, name: @intention.name, number_of_participants: @intention.number_of_participants, participants: @intention.participants, user_id: @intention.user_id } }
    end

    assert_response 201
  end

  test "should show intention" do
    get intention_url(@intention)
    assert_response :success
  end

  test "should update intention" do
    patch intention_url(@intention), params: { intention: { emergency_name: @intention.emergency_name, emergency_number: @intention.emergency_number, name: @intention.name, number_of_participants: @intention.number_of_participants, participants: @intention.participants, user_id: @intention.user_id } }
    assert_response 200
  end

  test "should destroy intention" do
    assert_difference('Intention.count', -1) do
      delete intention_url(@intention)
    end

    assert_response 204
  end
end

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

class Booking < ApplicationRecord
  belongs_to :hut
  belongs_to :intention

  validates :date, presence: true
  validates :comment, presence: true
  validates :hut_id, presence: true, if: Proc.new { |a| a.booking_type == 'hut' }
end

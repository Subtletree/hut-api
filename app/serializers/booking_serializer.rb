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

class BookingSerializer < ActiveModel::Serializer
  attributes :id, :booking_type, :comment, :date
  has_one :hut
  belongs_to :intention

  def hut
    {id: object.hut_id}
  end
end

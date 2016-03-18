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

class Intention < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
  validates :number_of_participants, presence: true
  validates :emergency_name, presence: true
  validates :emergency_number, presence: true
end

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

class IntentionSerializer < ActiveModel::Serializer
  attributes :id, :name, :participants, :number_of_participants, :emergency_name, :emergency_number
  has_one :user
end

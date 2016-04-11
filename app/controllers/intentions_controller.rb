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

class IntentionsController < ApplicationController

  before_action :authenticate!, only: [:create]
  before_action :set_intention, only: [:show, :update, :destroy]

  # GET /intentions
  def index
    @intentions = Intention.all

    render json: @intentions
  end

  # GET /intentions/1
  def show
    render json: @intention
  end

  # POST /intentions
  def create
    @intention = Intention.new(intention_params.merge(user_id: this_user_id))

    if @intention.save
      render json: @intention, status: :created, location: @intention
    else
      render json: @intention, status: 422, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer

      #render json: @intention.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /intentions/1
  def update
    if @intention.update(intention_params)
      render json: @intention
    else
      render json: @intention.errors, status: :unprocessable_entity
    end
  end

  # DELETE /intentions/1
  def destroy
    @intention.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intention
      @intention = Intention.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def intention_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :participants, :number_of_participants, :emergency_name, :emergency_number])
    end
end

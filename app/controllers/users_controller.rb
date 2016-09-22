# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  first_name                      :string
#  last_name                       :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  activation_state                :string
#  activation_token                :string
#  activation_token_expires_at     :datetime
#  token                           :string
#  phone_number                    :string
#  mobile_number                   :string
#

class UsersController < ApplicationController
  before_action :authenticate!, only: [:show]
  before_action :set_user, only: [:update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    @user = User.includes(intentions: [:bookings]).find(this_user_id)
    render json: @user, include: [intentions: [:bookings]]
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user, status: 422, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
      #render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1`
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:email, :first_name, :last_name, :mobile_number, :password, :password_confirmation])
    end
end

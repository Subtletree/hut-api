class UserSessionsController < ApplicationController

  before_action :set_user_by_token, only: [:destroy]

  def create
    @user = User.where(email: params[:email]).first
    if @user and @user.valid_password?(params[:password]) and @user.activation_state == 'active'
      @token = SecureRandom.urlsafe_base64(nil, false)
      @user.update_attribute(:token, BCrypt::Password.create(@token))
      render json: {token: @user.create_new_auth_token}
    elsif @user and @user.activation_state == 'pending'
      render json: {
        success: false,
        errors: ['email not confirmed']
      }, status: 401
    else
      render json: {
        errors: ['Bad Credentials']
      }, status: 401
    end
  end

  def destroy
    @user.update_attribute(:token, nil)
    render status: 200
  end
end

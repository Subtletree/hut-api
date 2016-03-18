class UserSessionsController < ApplicationController

  before_action :set_user_by_token, only: [:destroy]

  def create
    @user = User.where(email: params[:email]).first
    if @user and @user.valid_password?(params[:password])
      @token = SecureRandom.urlsafe_base64(nil, false)
      @user.update_attribute(:token, BCrypt::Password.create(@token))
      render json: {token: @user.create_new_auth_token}
    else
      render json: {
        errors: ['Invalid email or password']
      }, status: 401
    end
  end

  def destroy
    @user.update_attribute(:token, nil)
    render status: 200
  end
end

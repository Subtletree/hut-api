class UserSessionsController < ApplicationController

  before_action :authenticate!, only: [:destroy]

  def create
    # todo: make email search case insensitive
    @user = User.find_by_email(params[:email])
    if @user and @user.valid_password?(params[:password])
      render json: {token: generate_jwt(@user)}
    else
      render json: {
        errors: ['Invalid email or password']
      }, status: 401
    end
  end

  # dont need action at all?
  def destroy
    #@user.update_attribute(:token, nil)
    render status: 200
  end
end

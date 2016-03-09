require 'bcrypt'

module RequestTokenAuth
  extend ActiveSupport::Concern

  # user auth
  def set_user_by_token
    # parse header for values necessary for authentication
    uid        = request.headers['uid'] || params['uid']
    @token     = request.headers['access-token'] || params['access-token']

    return false unless @token

    # mitigate timing attacks by finding by uid instead of auth token
    user = uid && User.find_by_uid(uid)

    if user && user.valid_token?(@token)
      return user
    else
      # zero all values previously set values
      return nil
    end
  end


end

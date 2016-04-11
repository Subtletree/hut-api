module RequestTokenAuth
  extend ActiveSupport::Concern

  def generate_jwt(user)
    TokenProvider.issue_token({
      user_id: user.id,
      user_email: user.email
    })
  end

  def validate_token!
    begin
      TokenProvider.valid?(token)
    rescue
      head :unauthorized
      #render json: 'Unauthorised', status: 401, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer and return false
    end
  end

  def authenticate!(fetch_user: false)
    begin
      payload, header = TokenProvider.valid?(token)
      if fetch_user
        @this_user = User.find_by(id: payload['user_id'])
      else
        @this_user_id = payload['user_id']
      end
    rescue
      head :unauthorized
      #render json: 'Unauthorised', status: 401, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer and return false
    end
  end

  def this_user
    @this_user ||= authenticate!(fetch_user: true)
  end

  def this_user_id
    @this_user_id ||= authenticate!
  end

  def token
    request.headers['Authorization'].split(' ').last
  end
end

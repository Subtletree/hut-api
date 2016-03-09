require 'bcrypt'

module TokenAuth
  extend ActiveSupport::Concern

    # update user's auth token
    def create_new_auth_token
      generated_token = SecureRandom.urlsafe_base64(nil, false)
      token_hash   = ::BCrypt::Password.create(generated_token)
      self.update_attribute(:token, token_hash)
      generated_token
    end

    # Valid token checks
    def valid_token?(token)
      #return false unless self.tokens[client_id]
      #return true if token_is_current?(token, client_id)
      #return true if token_can_be_reused?(token, client_id)
      return true if self.token_matches?(token)

      # return false if none of the above conditions are met
      return false
    end

    def tokens_matches?(token)
      ::BCrypt::Password.new(self.token) == token
    end

end

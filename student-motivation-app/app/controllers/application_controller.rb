class ApplicationController < ActionController::API
    before_action :authorize
  
    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'ni kubaad')
    end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'ni kubaad', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorize
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  end
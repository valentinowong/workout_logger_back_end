class ApplicationController < ActionController::API
    before_action :authorized 

    def encode_token(payload)
        JWT.encode(payload, 'my_secret', 'HS256')
    end 

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token(token)
        if auth_header
        JWT.decode(token, 'my_secret', true, algorithm: 'HS256') 
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

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless loged_in?
    end 
end

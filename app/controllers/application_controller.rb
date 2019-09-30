class ApplicationController < ActionController::API
    before_action :authorized 

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end 

    def logged_in?
        !!current_user
    end

    def current_user
        @user ||= User.find_by(id: user_id)   
    end

    def user_id
        decoded_token.first['id']
    end 

    def decoded_token
        begin
            JWT.decode(request.headers['Authorization'], 'my_secret', false, { :algorithm => 'HS256'}) 
        rescue JWT::DecodedError
            [{}]
        end 
    end 

    def encode_token(payload)
        JWT.encode(payload, 'my_secret', 'HS256')
    end 

    # def auth_header
    #     request.headers['Authorization']
    # end


end

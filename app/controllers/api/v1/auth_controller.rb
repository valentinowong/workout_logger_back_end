class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    #handle login
    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            render json: {username: user.username, id: user.id, token: encode_token({id: user.id})}
        else 
            render({json: {error: 'User is invalid'}, status: 401})
        end 
    end 
end
 
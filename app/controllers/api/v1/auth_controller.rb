class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]
    #handle login
    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            render json: {currentUser: user, token: encode_token({id: user.id})}
        else 
            render({json: {error: 'User is invalid'}, status: 401})
        end 
    end 

    def show
        render json: {currentUser: current_user}
    end 
end
 
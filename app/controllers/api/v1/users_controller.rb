class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    
    def create
        # return the user
        @user = User.create(user_params)
        #generate a JWT Token
        #return the JWT token, along with the userobject to the frontend
        render json: { currentUser: @user, token: encode_token(@user.id)}
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end

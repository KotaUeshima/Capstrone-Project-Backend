class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  
    def record_invalid invalid
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def create
        user = User.create!(user_params)

        if user.valid? 
            render json: {user: UserSerializer.new(user), status: :created}
        else
            render json: {error: "Failed to create user", status: :not_created}
        end
    end

    def show
        render json: {user: UserSerializer.new(@user)}
    end

    private

    def user_params
        params.require(:user).permit(:username, :name, :password)
    end
end

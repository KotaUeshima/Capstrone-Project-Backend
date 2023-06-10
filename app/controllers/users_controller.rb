class UsersController < ApplicationController
    skip_before_action :authorized
    before_action :find_user, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  
    def record_invalid invalid
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET /users/:id
    def show
        render json: UserSerializer.new(@user)
    end

    # POST /users
    # need to send object as { "user": { user object }}
    def create
        # will raise ActiveRecord::RecordInvalid if invalid
        @user = User.create!(user_params)
        render json: {user: UserSerializer.new(@user), status: :created}
    end

    # PATCH /users/:id
    def update
        if @user
            @user.update!(update_user_params)
            render json: {user: UserSerializer.new(@user), status: :ok}
        else
            render json: {message: "User does not exist", status: :bad_request}
        end
    end
    
    # DELETE /users/:id
    def destroy
        if @user
            @user.destroy
            render json: {message: "Succesfully deleted account", status: :ok}
        else
            render json: {message: "User does not exist", status: :bad_request}
        end
    end

    private
    # restrict parameters for user object
    def user_params
        params.require(:user).permit(:firstName, :lastName, :email, :password)
    end

    def update_user_params
        params.require(:user).permit(:firstName, :lastName, :email)
    end

    # find user instance based on incoming id number
    def find_user 
        @user = User.find(params[:id])
    end
end

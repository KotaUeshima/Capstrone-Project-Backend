class UsersController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy, :count]
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
    # can add ", serializer: UserSerializer" but seems to be done automatically
    def show
        render json: @user
    end

    # POST /users
    # need to send object as { "user": {"username": "Kota", "password": "test"}}
    def create
        # ! will raise ActiveRecord::RecordInvalid exception if invalid
        @user = User.create!(user_params)
        # may not need user.valid? due to nature of !
        if @user.valid? 
            render json: {user: UserSerializer.new(@user), status: :created}
        else
            render json: {error: "Failed to create user", status: :unprocessable_entity}
        end
    end

    # PUTS /users/:id
    def update
        if @user
            @user.update!(user_params)
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

    # def count
    #     render json: {user: User.all.count, song: Song.all.count}
    # end

    # not sure for another route
    # def show
    #     render json: {user: UserSerializer.new(@user)}
    # end

    private
    # restrict parameters for user to be username and password
    def user_params
        params.require(:user).permit(:username, :password)
    end
    # find user instance based on incoming id number
    def find_user 
        @user = User.find(params[:id])
    end
end

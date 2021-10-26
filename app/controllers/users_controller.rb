class UsersController < ApplicationController
  def  show
    if current_user
      render json: User.all.as_json
    else
      render json: {message: "You must be logged in to see users."}
    end
  end
  
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end

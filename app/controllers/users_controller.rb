class UsersController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save
      render json: { token: Jwt.encode(user_id: user.id) }
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: Jwt.encode(user_id: user.id) }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

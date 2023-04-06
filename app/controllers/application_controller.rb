class ApplicationController < ActionController::API
  before_action :authenticate_request, except: [:signup, :login]

  private

  def authenticate_request
    header = request.headers['Authorization']

    if header.present?
      token = header.split(' ').last
      begin
        decoded = Jwt.decode(token)
        @current_user = User.find(decoded['user_id'])
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
      end
    else
      render json: { error: 'Missing token' }, status: :unauthorized
    end
  end
end

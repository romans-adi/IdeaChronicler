class Api::V1::ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request, unless: -> { Rails.env.test? }

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end

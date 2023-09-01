class CustomSessionsController < Devise::SessionsController
  def create
    super do |user|
      if user
        token = TokenGenerator.generate_authentication_token(user.id)
        response.headers['Authorization'] = "Bearer #{token}"
      end
    end
  end

  def destroy
    sign_out(current_user) if user_signed_in?
    redirect_to root_path
  end
end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  
  def facebook
    oauth_sign_in
  end

  def twitter
    oauth_sign_in
  end

  def failure
    redirect_to root_path, notice: "Please try signing in again"
  end

private
  def oauth_sign_in
    user = OauthProvider.new(request.env["omniauth.auth"], current_user).save

    if user.present?
      return show_registration_error if user.errors.any?
      return sign_in_and_redirect(user)
      return notify_to_confirm
    else
      show_registration_error
    end
  end

  def sign_in_and_redirect(user)
    sign_in user, event: :authentication
    redirect_to authenticated_root_path, notice: "Successfully signed-in using #{provider}"
  end

  def show_registration_error
    session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
    redirect_to root_path, alert: "Failed to register you into the system. Please try again."
  end

  def notify_to_confirm
    session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
    redirect_to root_path, notice: "Please confirm your email to sign in."
  end

  def provider
    request.env["omniauth.auth"].provider.titleize
  end
end


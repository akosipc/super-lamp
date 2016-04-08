class OauthProvider

  def initialize(auth_params, current_user = nil, options = {})
    @auth_params = auth_params
    @current_user = current_user
    @options = options
  end

  def save
    find_then_create_or_update_provider

    @current_user = User.create(user_params) unless @current_user.present?
    @current_user.providers << @provider
    @current_user
  end

private
  def find_then_create_or_update_provider
    if @provider = find_provider 
      @provider.update_attributes(provider_params) 
    else
      @provider = Provider.create(provider_params)
    end
  end

  def find_provider
    Provider.find_by(name:  provider_params[:name],
                     uid:   provider_params[:uid])
  end
  
  def provider_params
    { avatar: @auth_params[:info][:image],
      name:   @auth_params[:provider],
      uid:    @auth_params[:uid],
      token:  @auth_params[:credentials][:token] }
  end

  def user_params
    password = Devise.friendly_token(8)

    { last_name:              @auth_params[:info][:name].split[-1],
      first_name:             @auth_params[:info][:name].split[0..-2].join(" "),
      email:                  @auth_params[:info][:email],
      password:               password,
      password_confirmation:  password }
  end

end

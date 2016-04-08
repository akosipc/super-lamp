require "rails_helper"

RSpec.describe OauthProvider do
  include OmniauthHelper
  
  let!(:user)     { create :user }

  describe "#save" do
    context "when a user and a provider is existing" do
      let!(:user)     { create :user }
      let!(:provider) { create :provider, :facebook, user: user }
      let!(:params) do
        auth_params({ 
          uid:        provider.uid,
          provider:   provider.name,
          credentials: { 
            token: "1234567890" 
          } 
        })
      end
      let!(:service) { OauthProvider.new(params, user) }

      it "creates a Provider record" do
        expect { service.save }.to change(Provider, :count).by(0)
      end

      it "creates a User record" do
        expect { service.save }.to change(User, :count).by(0)
      end

      it "assigns the service to the user" do
        user = service.save
        expect(user.providers.last.token).to eq params[:credentials][:token]
      end
    end

    context "when there is no current_user passed" do
      let!(:params)   { auth_params }
      let!(:provider) { OauthProvider.new(params) }

      it "creates a Provider record" do
        expect { provider.save }.to change(Provider, :count).by(1)
      end

      it "creates a User record" do
        expect { provider.save }.to change(User, :count).by(1)
      end

      it "assigns the provider to the user" do
        user = provider.save
        expect(user.providers.last.uid).to eq params[:uid]
      end
    end

    context "when there is a current_user passed" do
      let!(:params)   { auth_params }
      let!(:provider) { OauthProvider.new(params, user) }

      it "creates a Provider record" do
        expect { provider.save }.to change(Provider, :count).by(1)
      end

      it "doesn't create a User record" do
        expect { provider.save }.to change(User, :count).by(0)
      end

      it "assigns the provider to the user" do
        user = provider.save

        expect(user.providers.last.uid).to eq params[:uid]
      end
    end
  end
end

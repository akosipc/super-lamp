require "rails_helper"

RSpec.describe Users::OmniauthCallbacksController do
  describe "#facebook" do
    it "calls the OauthProvider#save" do
      expect_any_instance_of(OauthProvider).to receive(:save)

      get :facebook
    end
  end

  describe "#twitter" do
    it "calls the OauthProvider#save" do
      expect_any_instance_of(OauthProvider).to receive(:save)

      get :twitter
    end
  end


end

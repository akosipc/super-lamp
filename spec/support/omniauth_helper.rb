module OmniauthHelper

  def auth_params(hash = {})
    {
      info: { 
        image: "http://placecage.com/c/300/300",
        name: "Superman at Batman",
        email:  "test@example.com"
      },
      provider:   "facebook",
      uid:        "1234567890-",
      credentials:  {
        token:      "w3456789032412321refashd,ffs1,"
      }
    }.deep_merge(hash)
  end
end

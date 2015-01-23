class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    sliced = auth.slice("provider", "uid")
    where(provider: sliced[:provider], uid: sliced[:uid]).first || 
    create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.access_token = auth["credentials"]["token"]
      user.access_token_secret = auth["credentials"]["secret"]
    end
  end




end

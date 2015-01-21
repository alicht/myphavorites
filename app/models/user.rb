class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

#   def self.create_from_omniauth(auth)
#     create! do |user|
#       user.provider = auth["provider"]
#       user.uid = auth["uid"]
#       user.name = auth["info"]["nickname"]
#       user.access_token = auth["credentials"]["token"]
#       user.access_token_secret = auth["credentials"]["secret"]
#     end
#   end
# end

def self.create_from_omniauth(auth)
  where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
    user.provider = auth["provider"]
    user.uid      = auth["uid"]
    user.name     = auth["info"]["nickname"]
    user.access_token = auth["credentials"]["token"]
    user.access_token_secret = auth["credentials"]["secret"]
    user.save
  end
end


end

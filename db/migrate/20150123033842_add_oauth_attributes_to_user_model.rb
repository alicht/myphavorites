class AddOauthAttributesToUserModel < ActiveRecord::Migration
  def change
  	change_table :users  do |t|
	    t.string   :provider
	    t.string   :uid
	    t.string   :name
	    t.string   :access_token
	    t.string   :access_token_secret
    end
  end
end

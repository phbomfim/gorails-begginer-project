class OmniauthCallbacksController < ApplicationController
    def twitter
        # Verify if exists other twitter user with that nickname. 
        # If exist or not = first_or_initalize.
        
        twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        twitter_account.update(
            name: auth.info.name,
            image: auth.info.image,
            token: auth.credentials.token,
            secret: auth.credentials.secret,
        )

        redirect_to root_path, notice: "Successfully connected your Twitter Account"
    end

    def auth
        request.env['omniauth.auth']
    end
end

def sign_in(user)
  visit new_user_session_path

  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password

  click_button "Sign in"
end

def oauth_sign_in(user)
  create_client_app(user: user, name: "Spec")
end

def create_client_app(options)
  user = options[:user]
  name = options[:name] 
  Opro::Oauth::ClientApp.create_with_user_and_name(user, name)
end

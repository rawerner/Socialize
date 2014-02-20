# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Socialize::Application.config.secret_key_base = secure_token

# Socialize::Application.config.secret_key_base = 'af153c1a9aacd3ed430a806114adada7ef8f275f796831cf3b9af22274690885aebc72a6efdc96ea3293a9022be803efb2d392a59bf0747ced60dc9e2ed6ec36'

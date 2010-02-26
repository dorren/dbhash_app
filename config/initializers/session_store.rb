# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dbhash_app_session',
  :secret      => '28e79304ba782035ea11c0b2ef14244768e3b5d56bb2be0e2078e69fcf65612912167f4666870a3dc2c9d58bba742641f470b2c9544b2d48623e5a4f92c84f45'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

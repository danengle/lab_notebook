# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lab2_session',
  :secret      => 'f455e129ee85b3e6fcb5c0378cd5a6cf9c5cb912ae4f070f00ad705041beef6bb0faff25439db9e4ed6fbe1ec66093d9e7192b973edd8c2be239f1df79dc6144'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

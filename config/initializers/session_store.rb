# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_facebooker_on_rails_session',
  :secret      => '292056c733b15e54e0c6bf56caff40a90004cde4ec1801645895fd930191ef384c4036609d4b4e4c7f44951ed872d9b9876b92444e7c66ebdec9986f076967d7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

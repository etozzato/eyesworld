# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_deezney.com_session',
  :secret      => '3a731ae8d18f6e72bf32c1e2f4a16ca131428cb48c6d5a5e98e1fb514623b66faedfde1896efcf0c1c53550b84df3d6783097c2e17c8db592141430528433685'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

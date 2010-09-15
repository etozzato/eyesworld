#gem_path = File.expand_path('~/.gems')
#ENV['GEM_PATH'] =  gem_path + ':/usr/lib/ruby/gems/1.8' if gem_path

RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'

  config.action_controller.session = {
    :key => '_deezney_session',
    :secret      => '6777c1886b123fcb81a1b240dc74183e4e3397075ef70b16c4a2907eacfa33e589f244c7e6ee182eb60d88ebc7fc9d9704b80596c8d3909306c1b980157af23c'
  }
  config.action_controller.session_store = :active_record_store
  #config.gem "restfulx"
end
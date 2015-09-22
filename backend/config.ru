# adjust port to 9293
#\ -p 9293

require 'rubygems'
require 'bundler'

Bundler.require

require 'rack'
require 'rack/contrib'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [ :get, :post, :options, :put, :delete ]
  end
end

use Rack::Deflater

# deliver static content from the public folder
use Rack::Static, :root => 'public', :index => 'index.html'

# mount the phonebook api
$LOAD_PATH << '.'
require 'lib/app/api_v1'

run Phonebook::APIv1

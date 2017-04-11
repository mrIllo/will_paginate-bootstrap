require 'sinatra'
require 'will_paginate-bootstrap'
require 'will_paginate/collection'

CDN_PATH = '//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css'

$template = <<EOHTML
<html>
<head>
<title>will_paginate-boostrap Example App</title>
<link href='<%= CDN_PATH %>' rel='stylesheet'>
</head>
<body>
<%= will_paginate @collection, renderer: BootstrapPagination::Sinatra %>
</body>
</html>
EOHTML

def build_collection
  page = params[:page].to_i > 0 ? params[:page].to_i : 1
  @collection = WillPaginate::Collection.new page, 10, 100_000
end

get '/' do
  build_collection
  erb $template
end

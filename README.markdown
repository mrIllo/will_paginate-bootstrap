# will_paginate-bootstrap

---

[![Code Climate](https://codeclimate.com/github/bootstrap-ruby/will_paginate-bootstrap.png)](https://codeclimate.com/github/bootstrap-ruby/will_paginate-bootstrap)

![Bootstrap Pagination Component](https://raw.github.com/bootstrap-ruby/will_paginate-bootstrap/master/pagination.png)

This gem integrates the [Twitter Bootstrap](http://getbootstrap.com/) [pagination component](http://getbootstrap.com/components/#pagination) with the [will_paginate](https://github.com/mislav/will_paginate) pagination gem.

Just like will_paginate, Rails and Sinatra are supported.

## Install

  * `gem install will_paginate-bootstrap`, *or*
  * For projects using Bundler, add `gem 'will_paginate-bootstrap'` to your `Gemfile` (and then run `bundle install`).

## Usage

### Rails

  1. Load the Bootstrap CSS in your template.
  2. In your view, use the `renderer: BootstrapPagination::Rails` option with the `will_paginate` helper, for example:

```ruby
<%= will_paginate @collection, renderer: BootstrapPagination::Rails %>
```

### Sinatra

  1. Load the Bootstrap CSS in your template.
  2. `require "will_paginate-bootstrap"` in your Sinatra app.
  3. In your view, use the `renderer: BootstrapPagination::Sinatra` option with the `will_paginate` helper, for example:

```ruby
<%= will_paginate @collection, renderer: BootstrapPagination::Sinatra %>
```

## Compatibility

<table>
	<tr>
		<th>Ruby</th>
		<td>>= 2.4.1</td>
	</tr>
	<tr>
		<th>will_paginate</th>
		<td>>= 3.0.3</td>
	</tr>
	<tr>
		<th>Twitter Bootstrap</th>
		<td>>= 4.0.0</td>
	</tr>
</table>

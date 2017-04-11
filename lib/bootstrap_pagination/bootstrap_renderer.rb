require 'bootstrap_pagination/version'

module BootstrapPagination
  #
  module BootstrapRenderer
    ELLIPSIS = '&hellip;'.freeze

    def to_html
      list_items = pagination.map do |item|
        case item
        when Integer
          page_number(item)
        else
          send(item)
        end
      end.join(@options[:link_separator])

      tag('ul', list_items, class: ul_class)
    end

    def container_attributes
      super.except(*[:link_options]) # class: 'page-link'
    end

    protected

    def page_number(i)
      link_options = @options[:link_options] || {}
      if i == current_page
        tag('li', tag('span', i, class: 'page-link'), class: 'page-item active')
      else
        tag('li', link(i, i, link_options.merge(rel: "#{rel_value(i)} nofollow")))
      end
    end

    def previous_or_next_page(i, text, klass)
      link_options = @options[:link_options] || {}
      if i
        tag('li', link(text, i, link_options.merge(rel: 'nofollow')), class: klass)
      else
        tag('li', tag('span', text), class: format('%s disabled', klass))
      end
    end

    def gap
      tag('li', tag('span', ELLIPSIS), class: 'disabled page-item')
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], 'prev')
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], 'next')
    end

    def ul_class
      ['pagination', @options[:class]].compact.join(' ')
    end
  end
end

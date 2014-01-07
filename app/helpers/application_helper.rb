module ApplicationHelper

  def namespace_link_to(link_text, link_namespace, link_href = nil)
    class_name = params[:controller] =~ /^#{link_namespace}$|#{link_namespace}\/.*/ ? 'active' : nil
    content_tag(:li, :class => class_name) do
      link_to link_text, link_href || "/" + link_namespace + "/"
    end
  end

	def pagination_links(collection, options = {})
		options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
		options[:class] ||= 'pagination'
		options[:inner_window] ||= 2
		options[:outer_window] ||= 1
		options[:previous_label] ||= '&laquo;'.html_safe
		options[:next_label] ||= '&raquo;'.html_safe
		will_paginate(collection, options)
	end

end

module ApplicationHelper

  def namespace_link_to(link_text, link_namespace, link_href = nil)
    class_name = params[:controller] =~ /^#{link_namespace}$|#{link_namespace}\/.*/ ? 'active' : nil
    content_tag(:li, :class => class_name) do
      link_to link_text, link_href || "/" + link_namespace + "/"
    end
  end

end

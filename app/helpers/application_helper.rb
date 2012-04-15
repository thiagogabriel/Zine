module ApplicationHelper
  def breadcrumbs(links, here)
    links_string = "<ul class=\"breadcrumb\">"
    links_string += "<li>#{link_to("Home", root_path)}<span class=\"divider\">/</span></li>"
    for link in links
      links_string += "<li>#{link_to(link[0], link[1])}<span class=\"divider\">/</span></li>"
    end
    links_string += "<li class=\"active\">#{here}</li></ul>"
    links_string.html_safe
  end
  
  def icon(icon_name)
    "<i class=\"icon-#{icon_name}\"></i>".html_safe
  end
  
  def iconw(icon_name)
    "<i class=\"icon-#{icon_name} icon-white\"></i>".html_safe
  end
end
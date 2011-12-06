module ReadHelper
  def render_content(context)
    output = context
    if output =~ /\{"\s*(.+)\s*"\}/
      @quote = $1
      "<span class='has-pullquote' data-pullquote='#{@quote}'>#{output.gsub(/\{"\s*|\s*"\}/, '')}</span>"
    else
      return output
    end
  end
end

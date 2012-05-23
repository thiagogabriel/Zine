module LiquidFilters
  class PullquoteTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
      @align = (markup =~ /left/i) ? "left" : "right"
      super
    end

    def render(context)
      output = super
      #return "#{output.methods} || #{super} || #{super.class}"
      #if output.join =~ /\{"\s*(.+)\s*"\}/
      if output =~ /\{"\s*(.+)\s*"\}/
        #@quote = $1
        @quote = RubyPants.new($1).to_html
        #@quote = CGI.escape($1)
        "<span class='pullquote-#{@align}' data-pullquote='#{@quote}'>#{output.gsub(/\{"\s*|\s*"\}/, '')}</span>"
      else
        return "Surround your pullquote like this {\" text to be quoted \"}"
      end
    end
  end
end


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

  def render_this(text)
    Liquid::Template.register_tag('pullquote', LiquidFilters::PullquoteTag)
    RedCloth.new(Liquid::Template.parse(text).render({}, filters: [LiquidFilters])).to_html.html_safe
    #RedCloth.new(Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters])).to_html

  end
  
  def youtube_embed(url)
    begin
      url_params = url.gsub("http://www.youtube.com/watch?", "")
      result = {}.with_indifferent_access
      url_params.split('&').each do |element|
        element = element.split('=')
        result[element[0]] = element[1]
      end
      %{
        <iframe id="ytplayer" type="text/html" width="100%" height="390"
          src="http://www.youtube.com/embed/#{result["v"]}?theme=light&showinfo=0&rel=0"
          frameborder="0"></iframe>
      }.html_safe
    rescue Exception => e
      e
    end
  end
end

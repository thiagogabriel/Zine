module LiquidFilters
  class PullquoteTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
      @align = (markup =~ /left/i) ? "left" : "right"
      super
    end

    def render(context)
      output = super
      if output.join =~ /\{"\s*(.+)\s*"\}/
        #@quote = $1
        @quote = RubyPants.new($1).to_html
        #@quote = CGI.escape($1)
        "<span class='pullquote-#{@align}' data-pullquote='#{@quote}'>#{output.join.gsub(/\{"\s*|\s*"\}/, '')}</span>"
      else
        return "Surround your pullquote like this {\" text to be quoted \"}"
      end
    end
  end
end

Liquid::Template.register_tag('pullquote', LiquidFilters::PullquoteTag)

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
    RedCloth.new(Liquid::Template.parse(text).render({}, filters: [LiquidFilters])).to_html.html_safe
    #RedCloth.new(Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters])).to_html

  end
end

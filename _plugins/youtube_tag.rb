require 'rubygems'

# Usage:
#
#    {% video basefile Great Caption%}
#
class YouTubeTag < Liquid::Tag

  def initialize(tag_name, markup, tokens)
    super

    if markup.strip =~ /^([^\s]+)\s+(.+)$/
      @url = $1
      @figcaption = $2
    else
      @url = markup.strip
      @figcaption = ""
      end
  end

  def render(context)

    # renders output
    r  = "<figure class=\"responsive video\">"
    r += "<div class=\"video-wrapper\">"
    r += "<iframe src=\"http://www.youtube.com/embed/#{@url}?HD=1&amp;rel=0&amp;showinfo=0&amp;modestbranding=1\" frameborder=\"0\" allowfullscreen></iframe>"
    r += "</div>"

    if @figcaption != ""
    	r += "<figcaption>#{@figcaption}</figcaption>"
    end

    r += "</figure>"
  end
end

Liquid::Template.register_tag('youtube', YouTubeTag)
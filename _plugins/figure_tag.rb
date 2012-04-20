require 'rubygems'
require 'rmagick'

# Generates a responsive figure with figcaption and many images with correct size.
# Usage:
#
#    {% figure Great Caption%}
#       image/path/myimage.png  Description of this image
#    {% endfigure %}
#
#  (caption and alt are optionals)
#
# TODO allow post-relative paths

class FigureTag < Liquid::Block

  def initialize(tag_name, markup, tokens)
     super
     @figcaption = markup
  end

  def render(context)
    r  = "<figure class=\"responsive\">"

    super.each_line do |line|
    	line = line.strip
    	if line != ""

    		# splits line
    		if line =~ /^([^\s]+)\s+(.+)$/
    			img = $1
    			alt = $2
    		else
    			img = line
    			alt = ""
    		end

    		# get image size
			image = Magick::ImageList.new("img/posts/#{img}").first
	        original_width, original_height = image.columns, image.rows

	        #output image
    		r += "<img src=\"/img/posts/#{img}\" style=\"max-width:#{original_width}px;max-height:#{original_height}px\" alt=\"#{alt}\" title=\"#{alt}\">"
    	end
    end

    if @figcaption != ""
    	r += "<figcaption>"+@figcaption+"</figcaption>"
    end

    r += "</figure>"
  end
end

Liquid::Template.register_tag('figure', FigureTag)
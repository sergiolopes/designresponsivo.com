module Jekyll
  class CodeTag < Jekyll::HighlightBlock

    def initialize(tag_name, text, tokens)
      super(tag_name, text + ' linenos', tokens)
      
    end
  end
end

Liquid::Template.register_tag('code', Jekyll::CodeTag)
module Jekyll
  module MdToHtml
    def md_to_html(input)
      Jekyll.logger.info "MdToHtml Plugin", "Replacing .md links with .html"
      input.gsub(/\.md(?=["')\s])/i, '.html')
    end
  end
end

Liquid::Template.register_filter(Jekyll::MdToHtml)

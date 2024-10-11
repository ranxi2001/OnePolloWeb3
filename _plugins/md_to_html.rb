module Jekyll
  module MdToHtml
    def md_to_html(input)
      Jekyll.logger.info "MdToHtml Plugin", "Replacing .md links with .html"

      # 首先替换 .md 为 .html
      input = input.gsub(/\.md(?=["')\s])/i, '.html')

      # 匹配纯文本 URL 并自动转换为 HTML 超链接，避免重复转换已经是链接的部分
      input.gsub!(%r{(?<!href=['"])https?://[^\s<>\n]+}) do |url|
        "<a href='#{url}'>#{url}</a>"
      end

      input # 返回修改后的输入
    end
  end
end

Liquid::Template.register_filter(Jekyll::MdToHtml)

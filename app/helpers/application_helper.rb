module ApplicationHelper
  def markdown(text)
    raw Redcarpet::Markdown.new(BbsRender.new(
      filter_html: true, no_links: true, no_images: true,
      no_styles: true),
      autolink: false, space_after_headers: true,
      escape_html: true, strikethrough: true,
      underline: true, superscript: true,
      no_intra_emphasis: true, tables: false,
      quote: false, disable_indented_code_blocks: true
    ).render(text)
  end
end


class BbsRender < Redcarpet::Render::HTML
  def block_quote(quote)
    %(<blockquote style="color: green;margin-left:0;">#{quote.insert(3, ">")}</blockquote>)
  end
end

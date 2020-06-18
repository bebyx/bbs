module ApplicationHelper
  def markdown(text)
    raw Redcarpet::Markdown.new(BbsRender.new(
      no_links: true, no_images: true,
      no_styles: true, escape_html: true,
      prettify: true),
      autolink: false, space_after_headers: false,
      strikethrough: true, underline: true,
      superscript: true, no_intra_emphasis: true,
      tables: false, quote: false,
      disable_indented_code_blocks: true
    ).render(text)
  end
end


class BbsRender < Redcarpet::Render::HTML

  def block_quote(quote)
    %(<blockquote style="color: green;margin-left:0;">#{quote}</blockquote>)
  end

  def header(text, level)
    if (Integer(text) rescue false)
      level = text
      "<a href='\##{level}'>\##{text}</a>"
    else
      level = "#" * level
      "<p>#{level + text}</p>"
    end
  end

  def spoiler(text)
    text.gsub!(/%%(.+)%%/) do
      "<span class='spoiler'>#{$1}</span>"
    end
    text
  end
  alias_method :postprocess, :spoiler

end

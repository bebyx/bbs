module ApplicationHelper
  def markdown(text)
    raw Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true,
      :escape_html => true).render(text)
  end
end

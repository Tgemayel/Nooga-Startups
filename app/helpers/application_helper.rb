module ApplicationHelper

  # Evaluates to true if the request is for the "homepage"
  def homepage?
    request.original_fullpath == "/"
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

end

module ApplicationHelper
  def markdown(text)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
	  hard_wrap: true
    }    
	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
	markdown.render(text).html_safe
  end
  
    
end

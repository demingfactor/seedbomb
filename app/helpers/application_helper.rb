module ApplicationHelper
  def on_nav(*section, &block)
    if section.include?(nav_section)
      return block.call.to_s.html_safe
    end
    ""
  end
end

module GalleryGenerator
  def tabs(how_many_tabs)
    "  " * how_many_tabs
  end

  def add_tabs_before_every_line(multi_line_string, how_many_tabs)
    multi_line_string.each_line.map { |line| tabs(how_many_tabs) + line }.join
  end

  def remove_final_empty_line(multi_line_string)
    lines = multi_line_string.lines
    lines[-1] = lines[-1].sub(/[\r\n]$/, '') if lines.any?
    lines.join
  end

  def add_links_to_sources(multi_line_string)
    multi_line_string.gsub(/\[(\d+)\]/, '[<a href="#sources">\1</a>]')
  end
end

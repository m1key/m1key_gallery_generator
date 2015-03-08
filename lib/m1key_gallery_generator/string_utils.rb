module GalleryGenerator
  def tabs(how_many_tabs)
    tabs = ""
    how_many_tabs.times do
      tabs += "\t"
    end
    return tabs
  end

  def add_tabs_before_every_line(multi_line_string, how_many_tabs)
    result = ""
    multi_line_string.each_line do |line|
      result += tabs(how_many_tabs) + line
    end
    return result
  end

  def remove_final_empty_line(multi_line_string)
    result = ""
    index = 1
    multi_line_string.each_line do |line|
      if index == multi_line_string.lines.count
        line_with_empty_line_removed =  line.sub(/[\r\n|\r|\n]$/, '')
        result += line_with_empty_line_removed
      else
        result += line
      end
      index += 1
    end
    return result
  end

  def add_links_to_sources(multi_line_string)
    result = ""
    multi_line_string.each_line do |line|
      line_with_source_link_added =  line.gsub(/\[(\d+)\]/, '[<a href="#sources">\1</a>]')
      result += line_with_source_link_added
    end
    return result
  end
end


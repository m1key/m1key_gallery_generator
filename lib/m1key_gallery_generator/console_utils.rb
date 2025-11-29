module GalleryGenerator
  def compact(multi_line_string)
    multi_line_string.delete("\t\r\n").squeeze(' ')
  end
end


module GalleryGenerator
  def compact(multi_line_string)
    return multi_line_string.delete("\t").delete("\r").delete("\n").squeeze(' ')
  end
end


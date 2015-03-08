module GalleryGenerator
  class ViewablePhotoMetadata
    attr_reader :original_file_name, :height, :iso, :focal_length, :f_number, :exposure_time
    def initialize(original_file_name, height, iso, focal_length, f_number, exposure_time)
      @original_file_name = original_file_name
      @height = height
      @iso = iso
      @focal_length = focal_length
      @f_number = f_number
      @exposure_time = exposure_time
    end
  end
end


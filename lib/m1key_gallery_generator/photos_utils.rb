require 'exifr'
require 'fileutils'
require_relative 'viewable_photo_metadata'

module GalleryGenerator

  def photos_config_into_viewable_photos(working_directory, gallery_config)
    photos = []
    current_photo_number = 0
    total_photos_number = gallery_config.total_photos_number
    photo_id_digits = gallery_config.photo_id_digits
    puts "There are [#{total_photos_number}] photos total."
    gallery_config.photos.each do |photo|
      current_photo_number += 1
      photo_id = to_photo_id(current_photo_number, photo_id_digits)
      photo_title = photo["title"]
      photo_description = photo["description"]
      photo_file_name_contains = photo["fileNameContains"]
      photo_technical_info = photo["technicalInfo"]
      photo_metadata = get_metadata_for_image_with_file_name_containing(working_directory, photo_file_name_contains)

      puts "Adding photo with ID [#{photo_id}], title [#{photo_title}], height [#{photo_metadata.height}], description [#{compact(photo["description"])}]..."
      photos.push ViewablePhoto.new(photo_id, photo_title, photo_description, photo_metadata, photo_technical_info)

      create_gallery_image(photo_metadata.original_file_name, gallery_config.slug, photo_id, working_directory)
    end
    return photos
  end

  def to_photo_id(current_photo_number, photo_id_digits)
    photo_id = "#{current_photo_number}"
    while photo_id.size < photo_id_digits
      photo_id = "0" + photo_id
    end
    return photo_id
  end

  def get_metadata_for_image_with_file_name_containing(working_directory, photo_file_name_contains)
    selected_file_name = ""
    Dir.entries(working_directory).each do |file_name|
      if file_name.include? photo_file_name_contains.to_s
        unless selected_file_name == ""
          puts "WARN  More than one file name matches [#{photo_file_name_contains}]. Will use the last one that matches."
        end
        selected_file_name = file_name
      end
    end
    if selected_file_name == ""
      raise "ERROR  No matching photo found for #{photo_file_name_contains}."
      return
    end
 
    exif = EXIFR::JPEG.new(File.join(working_directory, selected_file_name))
    photo_height = exif.height
    photo_iso = exif.iso_speed_ratings
    photo_focal_length = exif.focal_length.to_f.round.to_s
    photo_f_number = exif.f_number.to_f
    photo_exposure_time = exif.exposure_time.to_s
    return ViewablePhotoMetadata.new(selected_file_name, photo_height, photo_iso, photo_focal_length, photo_f_number, photo_exposure_time)
  end

  def create_gallery_image(original_file_name, gallery_slug, photo_id, working_directory)
    FileUtils.cp(File.join(working_directory, original_file_name), File.join(working_directory, gallery_slug + "_" + photo_id + File.extname(original_file_name)))
  end
end

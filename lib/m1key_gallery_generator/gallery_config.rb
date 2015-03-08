require 'date'
require 'yaml'
require_relative 'console_utils'

module GalleryGenerator
  class GalleryConfig

    attr_reader :title, :map_url, :map_title, :slug, :upload_date, :description, :sources, :year, :photos

    def initialize(yaml_config_file_name)
      puts "Attempting to parse #{yaml_config_file_name} to read gallery configuration..."
      gallery_configuration = YAML.load_file(yaml_config_file_name)
      puts "Parsed, seemingly."
      puts

      @title = gallery_configuration["title"]
      puts "Gallery title is [#{@title}]."
      @map_url = gallery_configuration["map"]["url"]
      puts "Map url is [#{@map_url}]."
      @map_title = gallery_configuration["map"]["title"]
      puts "Map title is [#{@map_title}]."
      @slug = gallery_configuration["slug"]
      puts "Gallery slug is [#{@slug}]."
      @upload_date = gallery_configuration["upload_date"]
      puts "Gallery upload date is [#{@upload_date}]."
      @description = gallery_configuration["description"]
      puts "Gallery description is [#{compact(@description)}]."

      @sources = gallery_configuration["sources"]

      gallery_year_from_yaml =  gallery_configuration["year"]
      if gallery_year_from_yaml == "current"
        puts "Using current year for gallery year..."
        current_year = Date.today.strftime("%Y")
        @year = Integer(current_year)
      else
        @year = Integer(gallery_year_from_yaml)
        unless @year > 999 and @year < 10000
          abort "Gallery year should be exactly four digits long."
        end
      end
      puts "Gallery year is [#{@year}]."
      puts

      @photos = gallery_configuration["photos"]
    end

    def total_photos_number
      @photos.size
    end

    def photo_id_digits
      Math::log10(total_photos_number)
    end
  end
end

require_relative 'string_utils'

module GalleryGenerator
  class ViewableGallery
    attr_reader :title, :description, :slug, :sources, :upload_date, :map_url, :map_title, :year, :photos, :small_print, :blurb, :genre
    def initialize(title, description, slug, sources, upload_date, map_url, map_title, year, viewable_photos, small_print, blurb, genre)
      @title = String.new(title)
      @description = description
      @slug = slug
      @sources = sources
      @upload_date = upload_date
      @map_url = map_url
      @map_title = map_title
      @year = year
      @photos = viewable_photos
      @small_print = small_print
      @blurb = blurb
      @genre = genre
    end

    def get_binding
      binding
    end

    def update_using(*update_functions)
      updated_gallery = MutableViewableGallery.new(self)

      update_functions.each do |update_function|
        updated_gallery = update_function.call(updated_gallery)
      end

      ViewableGallery.new(updated_gallery.title, updated_gallery.description, updated_gallery.slug,
          updated_gallery.sources, updated_gallery.upload_date, updated_gallery.map_url,
          updated_gallery.map_title, updated_gallery.year, to_viewable_photos(updated_gallery.photos), updated_gallery.small_print, updated_gallery.blurb, updated_gallery.genre)
    end

    def to_viewable_photos(mutable_viewable_photos)
      mutable_viewable_photos.map do |mutable_viewable_photo|
        ViewablePhoto.new(mutable_viewable_photo.id, mutable_viewable_photo.title, mutable_viewable_photo.description, mutable_viewable_photo.metadata, mutable_viewable_photo.technical_info)
      end
    end

  end

  class MutableViewableGallery
    attr_accessor :title, :description, :slug, :sources, :upload_date, :map_url, :map_title, :year, :photos, :small_print, :blurb, :genre
    def initialize(viewable_gallery)
      @title = viewable_gallery.title
      @description = viewable_gallery.description
      @slug = viewable_gallery.slug
      @sources = viewable_gallery.sources
      @upload_date = viewable_gallery.upload_date
      @map_url = viewable_gallery.map_url
      @map_title = viewable_gallery.map_title
      @year = viewable_gallery.year
      @photos = to_mutable_viewable_photos(viewable_gallery.photos)
      @small_print = viewable_gallery.small_print
      @blurb = viewable_gallery.blurb
      @genre = viewable_gallery.genre
    end

    def to_mutable_viewable_photos(viewable_photos)
      viewable_photos.map do |viewable_photo|
        MutableViewablePhoto.new(viewable_photo)
      end
    end
  end
end


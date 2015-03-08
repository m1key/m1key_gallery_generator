require_relative 'string_utils'

module GalleryGenerator
  class ViewableGallery
    attr_reader :title, :description, :slug, :sources, :upload_date, :map_url, :map_title, :year, :photos
    def initialize(title, description, slug, sources, upload_date, map_url, map_title, year, viewable_photos)
      @title = String.new(title)
      @description = description
      @slug = slug
      @sources = sources
      @upload_date = upload_date
      @map_url = map_url
      @map_title = map_title
      @year = year
      @photos = viewable_photos
    end

    def get_binding
      binding()
    end

    def update_using(*update_functions)
      updated_gallery = MutableViewableGallery.new(self)

      update_functions.each do |update_function|
        updated_gallery = update_function.call(updated_gallery)
      end

      return ViewableGallery.new(updated_gallery.title, updated_gallery.description, updated_gallery.slug, \
          updated_gallery.sources, updated_gallery.upload_date, updated_gallery.map_url, \
          updated_gallery.map_title, updated_gallery.year, to_viewable_photos(updated_gallery.photos))
    end

    def to_viewable_photos(mutable_viewable_photos)
      return mutable_viewable_photos.map do |mutable_viewable_photo|
        ViewablePhoto.new(mutable_viewable_photo.id, mutable_viewable_photo.title, mutable_viewable_photo.description, mutable_viewable_photo.metadata, mutable_viewable_photo.technical_info)
      end
    end

  end

  class MutableViewableGallery
    attr_accessor :title, :description, :slug, :sources, :upload_date, :map_url, :map_title, :year, :photos
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
    end

    def to_mutable_viewable_photos(viewable_photos)
      return viewable_photos.map do |viewable_photo|
        MutableViewablePhoto.new(viewable_photo)
      end
    end
  end
end


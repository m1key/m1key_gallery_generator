module GalleryGenerator
  class ViewablePhoto
    attr_reader :id, :title, :description, :metadata, :technical_info
    def initialize(id, title, description, metadata, technical_info)
      @id = id
      @title = title
      @description = description
      @metadata = metadata
      @technical_info = technical_info
    end
  end

  class MutableViewablePhoto
    attr_accessor :id, :title, :description, :metadata, :technical_info
    def initialize(viewable_photo)
      @id = viewable_photo.id
      @title = viewable_photo.title
      @description = viewable_photo.description
      @metadata = viewable_photo.metadata
      @technical_info = viewable_photo.technical_info
    end
  end
end


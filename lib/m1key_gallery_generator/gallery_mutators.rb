require_relative 'string_utils'

module GalleryGenerator
  def add_tabs_before_every_description_line(how_many_tabs)
    lambda do |mutable_viewable_content|
      mutable_viewable_content.description = add_tabs_before_every_line(mutable_viewable_content.description, how_many_tabs)
      mutable_viewable_content
    end
  end

  def add_links_to_descriptions
    lambda do |mutable_viewable_content|
      mutable_viewable_content.description = add_links_to_sources(mutable_viewable_content.description)
      mutable_viewable_content
    end
  end

  def remove_final_empty_line_from_description
    lambda do |mutable_viewable_content|
      mutable_viewable_content.description = remove_final_empty_line(mutable_viewable_content.description)
      mutable_viewable_content
    end
  end

  def for_each_photo(&update_function)
    lambda do |mutable_viewable_gallery|
      mutable_viewable_gallery.photos.each do |mutable_viewable_photo|
        update_function.call(mutable_viewable_photo)
      end
      mutable_viewable_gallery
    end
  end
end


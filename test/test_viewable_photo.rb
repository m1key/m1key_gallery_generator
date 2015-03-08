require 'minitest/autorun'
require 'm1key_gallery_generator'

include GalleryGenerator

class ViewablePhotoTest < Minitest::Test

  def test_mutable_viewable_photo_has_properties_from_given_viewable_photo
    photo_id = '10'
    photo_title = 'Sample photo'
    photo_description = 'Photo description'
    photo_metadata = nil
    photo_technical_info = 'Hand-held.'

    viewable_photo = ViewablePhoto.new(photo_id, photo_title, photo_description, photo_metadata, photo_technical_info)
    mutable_viewable_photo = MutableViewablePhoto.new(viewable_photo)
    
    assert_equal photo_id, mutable_viewable_photo.id, 'photo_id was not copied from viewable to mutable viewable photo'
  end

end


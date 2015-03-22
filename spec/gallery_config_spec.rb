require 'spec_helper'

include GalleryGenerator

describe ViewableGallery do
  it 'returns 1 photo digit for 1 photo' do
    config = GalleryConfig.new(File.join(File.dirname(__FILE__), '..', 'spec', 'data', 'gallery_with_1_photo.yaml'))
    expect(config.photo_id_digits).to eq(1)
  end
  it 'returns 1 photo digit for 2 photos' do
    config = GalleryConfig.new(File.join(File.dirname(__FILE__), '..', 'spec', 'data', 'gallery_with_2_photos.yaml'))
    expect(config.photo_id_digits).to eq(1)
  end
  it 'returns 2 photo digit for 10 photos' do
    config = GalleryConfig.new(File.join(File.dirname(__FILE__), '..', 'spec', 'data', 'gallery_with_10_photos.yaml'))
    expect(config.photo_id_digits).to eq(2)
  end

  it 'returns 1 photos for 1 photo' do
    config = GalleryConfig.new(File.join(File.dirname(__FILE__), '..', 'spec', 'data', 'gallery_with_1_photo.yaml'))
    expect(config.total_photos_number).to eq(1)
  end
  it 'returns 2 photos for 2 photo' do
    config = GalleryConfig.new(File.join(File.dirname(__FILE__), '..', 'spec', 'data', 'gallery_with_2_photos.yaml'))
    expect(config.total_photos_number).to eq(2)
  end
  it 'returns 10 photos for 10 photo' do
    config = GalleryConfig.new(File.join(File.dirname(__FILE__), '..', 'spec', 'data', 'gallery_with_10_photos.yaml'))
    expect(config.total_photos_number).to eq(10)
  end
end
require 'spec_helper'

include GalleryGenerator

RSpec.describe ViewableGallery do
  before do    
    @do_nothing = lambda do |mutable_viewable_content|
      return mutable_viewable_content
    end
    @original_title = 'Original Title'
    @viewable_gallery_original = ViewableGallery.new(title: @original_title, description: 'Gallery description', slug: 'gallery', \
      sources: [], upload_date: Time.now, map_url: "https://www.google.com/map/1", map_title: "Map Title", \
      year: "2015", viewable_photos: [], small_print: "", blurb: "Gallery blurb", genre: "photography", update_date: "2024-06-10")
  end

  def change_title(new_title)
    return lambda do |mutable_viewable_content|
      mutable_viewable_content.title = new_title
      return mutable_viewable_content
    end
  end

  it "returns a new instance when modified" do
    viewable_gallery_modified = @viewable_gallery_original.update_using(@do_nothing)
    expect(viewable_gallery_modified).not_to equal(@viewable_gallery_original)
  end

  it "updated version preserves gallery title when it is not modified" do
    viewable_gallery_modified = @viewable_gallery_original.update_using(@do_nothing)
    expect(viewable_gallery_modified.title).to eq(@original_title)
  end

  it "updated version has the new title when title modified" do
    new_title = "New Title"
    viewable_gallery_modified = @viewable_gallery_original.update_using(change_title(new_title))
    expect(viewable_gallery_modified.title).to eq(new_title)
  end

  it "original version has the original title even when title modified" do
    new_title = "New Title"
    @viewable_gallery_original.update_using(change_title(new_title))
    expect(@viewable_gallery_original.title).to eq(@original_title)
    expect(@viewable_gallery_original.title).to eq(new_title) # Playing with RSpect...
  end

  it "cannot be modified even when title variable used while creating is modified" do
    @original_title.downcase!
    expect(@viewable_gallery_original.title).not_to eq(@original_title)
  end 
end

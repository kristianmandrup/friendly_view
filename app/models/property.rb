class Property
  def mash
    @mash ||= Hashie::Mash.new  title: 'A beautiful property', 
                      description: %q{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mauris arcu, auctor ac rhoncus non, imperdiet non quam. Aliquam elementum vestibulum arcu, et vulputate lectus vehicula ac. Donec leo nibh, accumsan at hendrerit gravida, consequat a eros. Donec malesuada ullamcorper tincidunt. Aenean ligula ligula, elementum sit amet interdum a, euismod vitae leo. Proin tristique eleifend molestie. In hac habitasse platea dictumst. Quisque commodo elit vitae velit rhoncus nec tincidunt quam volutpat. Donec leo libero, ultricies vel imperdiet ut, volutpat fermentum enim. Phasellus vel metus sed neque tincidunt ultrices. Curabitur vehicula rhoncus semper. Ut facilisis ultrices lacus, consectetur ultricies ligula commodo sed. Praesent elit urna, pellentesque at porttitor ut, dignissim quis libero. Nulla dolor velit, volutpat a bibendum ut, hendrerit id mi. Pellentesque convallis erat in mi interdum rutrum. Phasellus interdum velit nulla.},
                      photos: photos
  end

  delegate :title, :description, :photos, to: :mash

  def photos
    @photos ||= RGallery::Photos.new nil, photo_class: ::Property::Photo
    5.times do
      @photos.pages << 6.times.map {|n| (Kernel.rand(7) + 1).to_s }
    end
    @photos
  end  
end
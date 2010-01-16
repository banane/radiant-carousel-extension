 # Radiant-carousel-extension
 # @license MIT License
 #
 module CarouselTag
  include Radiant::Taggable
  
  desc "Contains the panels of the carousel, and other objects."
  tag 'carousel' do |tag|
    content = '<div id="headerCarousel"><ul>'
    content << tag.expand
    content << '</ul></div>'
  end
  
  desc "Prints out the individual panels of the carousel."
  tag 'carousel_image' do |tag|
    %{ <li><a href="#{tag.attr['link']}">
      <img src=" #{tag.attr['src']}"></a>
      <p>#{tag.attr['caption']}</p>
    }
    
  end  
    
  

end
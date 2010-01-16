 # Radiant-carousel-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
class CarouselExtension < Radiant::Extension
  version "1.0"
  description "A rotating banner based on Infinite Carousel"
  url "http://blazingcloud.net"
  
  
    
  def activate
    Page.send :include, CarouselTag
    
  end
  
  def deactivate
  end
  
end

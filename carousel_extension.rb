# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

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

# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class CarouselExtension < Radiant::Extension
  version "1.0"
  description "A rotating banner based on Infinite Carousel"
  url "http://blazingcloud.net"
  
  
    
  def activate
    Page.send :include, CarouselTag
    

    ApplicationController.class_eval do
      before_filter :load_carousel_array
      
      # create and load image array from public directory
      def load_carousel_array
        @carousel_imgs = []
        dirpath = RAILS_ROOT + '/public/images/carousel/'
        print "************************#{dirpath}"
        Dir.foreach(dirpath) do |entry|
          filepath = dirpath + entry
          if(File.file?(filepath))
            @carousel_imgs.push(filepath)        
          end
        end
      end    
    end
  end
  
  def deactivate
  end
  
end

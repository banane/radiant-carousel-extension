# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class CarouselExtension < Radiant::Extension
  version "1.0"
  description "A rotating banner based on Infinite Carousel"
  url "http://blazingcloud.net"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :carousel2
  #   end
  # end
  
  def activate
    Page.send :include, CarouselTag
    
    # admin.tabs.add "Carousel2", "/admin/carousel2", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Carousel2"
  end
  
end

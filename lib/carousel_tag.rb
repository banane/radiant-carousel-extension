module CarouselTag
  include Radiant::Taggable
  
  desc "Creates a rotating image banner within a page"
  tag "carousel" do |tag|

    %{ <div id="headerCarousel">
        	<ul>
        		<li><img src="images/carousel/#{tag.attr['picture_1']}" /><p>#{tag.attr['caption_1']}</p></li>
        		<li><img src="images/carousel/#{tag.attr['picture_2']}"   /><p>#{tag.attr['caption_2']}</p></li>
        				<li><img src="images/carousel/#{tag.attr['picture_3']}"/><p>#{tag.attr['caption_3']}</p></li>
        	</ul>
        </div>
      #{tag.expand}
    }
  end
  
  desc "Loads images from a common directory and displays with no mark-up"
  tag "carousel_batch" do |tag|
    html = '<div id="headerCarousel"><ul>'
    
    @carousel_imgs = []
    dirpath = RAILS_ROOT + '/public/images/carousel/'
    Dir.foreach(dirpath) do |entry|
      filepath = dirpath + entry
      imgpath = '/images/carousel/' + entry
      if(File.file?(filepath))
        html += "<li><img src=" + imgpath + ' target="_top"></li>'      
      end
    end

    
    html += '</ul></div>'
    html << tag.expand
  end    
end
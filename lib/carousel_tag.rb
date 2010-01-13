module CarouselTag
  include Radiant::Taggable
  
  desc "Creates a rotating image banner within a page"
  tag "carousel" do |tag|

    %{ <div id="carousel">
        	<ul>
        		<li><img src="images/carousel/#{tag.attr['picture_1']}" width="500" height="213"  /><p>#{tag.attr['caption_1']}</p></li>
        		<li><img src="images/carousel/#{tag.attr['picture_2']}"   width="500" height="213 /><p>#{tag.attr['caption_2']}</p></li>
        				<li><img src="images/carousel/#{tag.attr['picture_3']}" width="500" height="213"  /><p>#{tag.attr['caption_3']}</p></li>
        	</ul>
        </div>
      #{tag.expand}
    }
  end
      
end
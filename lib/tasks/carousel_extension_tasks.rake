namespace :radiant do
  namespace :extensions do
    namespace :carousel do
      
      desc "Runs the migration of the Carousel extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          CarouselExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          CarouselExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Carousel to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from CarouselExtension"
        Dir[CarouselExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(CarouselExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end
      
      desc "Copies images from a local directory to the public folder."
      task :copy_images => :environment do
        puts "All the files in the local directory will be copied to a publically "
        puts "viewable web directory."
        puts "Directory path should be specified like: /usr/name/myfiles/"
        puts "Please enter the directory:"

        dirpath = $stdin.gets.chomp
        target_dirpath = CarouselExtension.root + '/public/images/carousel/'

        Dir.foreach(dirpath) do |entry|
          filepath = dirpath + entry
          if(File.file?(filepath))
             puts "Copying file: #{filepath}"
             cp filepath, target_dirpath, :verbose=>false
          end
        end
        puts "All files copied to public directory from #{dirpath}."
      end
      
    end
  end
end

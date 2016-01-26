require 'builder'

@environment = ENV['RACK_ENV'] || 'development'
@dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection @dbconfig[@environment]

class GalleryPhoto < ActiveRecord::Base
  self.table_name = "photos"
end

class GalleryApp
  def call(env)
    # Rack::Response.new "Hello Gallery!!", 200, {}
    # http://apidock.com/rails/Builder/XmlMarkup
    x = Builder::XmlMarkup.new :indent=>2
    x.declare! :DOCTYPE, :html
    x.html do
      x.head do
        x.title 'Gallery'
      end
      x.body do
        x.h1 'Gallery'
        Photo.all.each do |photo|
          x.h2 photo.username
          x.div do
            x.img src: photo.url
          end
        end
     end
    end
    response = Rack::Response.new(x.target!)
    response['Content-Type'] = 'text/html'
    response.finish
  end
end

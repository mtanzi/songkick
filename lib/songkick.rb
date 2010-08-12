require "httparty"

class Songkick
  
  include HTTParty
  API_VERSION = "3.0".freeze
  format :json
  base_uri "api.songkick.com/api/#{API_VERSION}"
  
  
  def initialize(apikey)
    @apikey = apikey
  end
  
  class SongkickError < StandardError
    attr_reader :data
    def initialize(data)
      @data = data
      super
    end
  end
  
  
  def event(options={})
    self.class.get('/events.json', :query => options.merge(:apikey => @apikey))
  end
  
  def user(user, options={})
    self.class.get("/users/#{user}/events.json", :query => options.merge(:apikey => @apikey))
  end
  
  def setlist(id, options={})
    self.class.get("/events/#{id}/setlists.json", :query => options.merge(:apikey => @apikey))
  end

end

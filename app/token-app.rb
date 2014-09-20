require "sinatra"
require 'haml'
require "sinatra/reloader"
require "sinatra/respond_with"
require 'digest/sha1'
require 'digest/md5'
require 'securerandom'

module Token
  class App < Sinatra::Base

    get '/' do        
      haml :index
    end

    get '/guid' do
      haml :guid, :locals => {:guid_code => SecureRandom.uuid}
    end

    get '/sha1' do
      haml :sha1
    end

    get '/md5' do
      haml :md5
    end

    get '/sha1+md5' do
      haml :sha1_md5
    end

    get '/md5+sha1' do
      haml :md5_sha1
    end

    post '/sha1_1' do
      haml :sha1_show, :locals => {:sha1_code => Digest::SHA1.hexdigest(params["string_code"])}
    end

    post '/md5_1' do
      haml :md5_show, :locals => {:md5_code => Digest::MD5.hexdigest(params["string_code"])}
    end

    post '/sha1_md5' do
      haml :sha1_md5_show, :locals => {:sha1_md5_code => Digest::SHA1.hexdigest(Digest::MD5.hexdigest(params["string_code"]))}
    end

    post '/md5_sha1' do
      haml :md5_sha1_show, :locals => {:md5_sha1_code => Digest::MD5.hexdigest(Digest::SHA1.hexdigest(params["string_code"]))}
    end

  end
end
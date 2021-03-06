require 'sinatra'
require 'sinatra/reloader'
require 'rss'

class App < Sinatra::Base
	register Sinatra::Reloader
	
	before do
		@title = "RSS アンテナ"
		@h1 = "おいどんブログまとめ"
	end
	
	
	get '/' do
		feeds = []
		feeds.push("http://egingerz.hatenablog.com/rss")
		#feeds.push("http://blog.tstylestudio.com/feed/")
		feeds.each { |feed|
			@rss = RSS::Parser.parse(feed)
		}
	
		erb :index
	end
end
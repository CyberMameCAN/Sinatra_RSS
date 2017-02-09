require 'sinatra'
require 'sinatra/reloader'
require 'rss'

before do
	@title = "RSS アンテナ"
end


get '/' do
	proxy_addr = "localhost"
	proxy_port = 5432
	host = "http://egingerz.hatenablog.com"
	path = "/rss"
	
	url = URI.parse(host+path)
	req = Net::HTTP::Get.new(url.path)
	puts "url.path => #{req}"
	res = Net::HTTP.new( host, nil, proxy_addr, proxy_port ).start { |http|
		http.request(req)
#	  @rss = RSS::Parser.parse(feed)
#	  puts @rss
	}
	case res
		when Net::HTTPSuccess
		  puts "HTTPSuccess"
		  res
		when Net::HTTPRedirection
		  puts "HTTPRedirection"
		  red['location']
		else
		  res.value
	end
	
	puts "res => " + res.body
#	@rss = RSS::Parser.parse(res)
#	puts @rss
	#feed = Net::HTTP.get(host, path).force_encoding('utf-8')
	#puts feed
	
	#@rss = RSS::Parser.parse("http://egingerz.hatenablog.com/rss")
	#erb :index
end

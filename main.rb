io = Sinatra::RocketIO

io.on :cast do |data, from, type|
	puts "#{data['message']}  (from:#{from}, type:#{type})"
	io.push :cast, data
end

io.on :connect do |session, type|
	puts "new client <#{session}> (type:#{type})"
	io.push :cast, {:message => "new #{type} client <#{session}>"}
	io.push :cast, {:message => "welcome <#{session}>"}, {:to => session}
end

io.on :disconnect do |session, type|
	puts "disconnect client <#{session}> (type:#{type})"
	io.push :cast, {:message => "bye <#{session}>"}
end

# reciver
get '/' do
	slim :reciver
end

# sender
get '/sender' do
	slim :sender
end

require "cinch" 

cadobot = Cinch::Bot.new do
	configure do |c|
		c.server = "irc.freenode.net"
		c.channels = ["#avocadosandwich"]
	end

	on :message, "hello" do |m|
		m.reply "hello to you too" 
	end
end

cadobot.start

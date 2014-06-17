require "cinch" 

cadobot = Cinch::Bot.new do
	configure do |c|
		c.server = "irc.freenode.net"
		c.channels = ["#avocadosandwich"]
	end

	on :message, "hello" do |m|
		m.reply "hello to you too" 
	end

	# On join event 
	on :join do |m|
		m.reply "Someone joined" 
		if (m.user.nick != @bot.nick)
			if (m.user.nick =~ /^gr[e3]g.*$/)
				m.reply "Hi Greg"
		  	 else 
				m.reply "Hi " + m.user.nick
			end 
		end
	end

	# On asking if franziska is there	
	on :message, /^[Ff]ranziska[?]?$/ do |m|
		m.reply "She is not here."
	end
end

cadobot.start

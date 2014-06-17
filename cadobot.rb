require "cinch" 

WHAT_MSG = "Hi Greg. This is a bot written by franka. Hope you are well."  

cadobot = Cinch::Bot.new do
  configure do |c|
    c.nick = "cadobot" 	  
    c.server = "irc.freenode.net"
    c.channels = ["#avocadosandwich"]
  end

  on :message, "hello" do |m|
    m.reply "hello to you too" 
  end
 
  on :message, "what" do |m|
    m.reply WHAT_MSG
  end

  on :join do |m|
    if (m.user.nick != @bot.nick)
      if (m.user.nick =~ /^gr[e3]g.*$/)
        m.reply "Hi Greg\nTry typing 'franziska' or 'what'."
      else 
        m.reply "Hi " + m.user.nick
      end      
    end
  end

  on :message, /^[Ff]ranziska[?]?$/ do |m|
    m.reply "She is not here."
  end
end

cadobot.start

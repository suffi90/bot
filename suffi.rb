require 'telegram_bot'
bot_name = "suffi_bot"

bot = TelegramBot.new(token: '166221712:AAFo0sTZgCy7xrsmTGxXlwFhW6YE5BwNFZA')
bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /greet/i
      reply.text = "Hello, #{message.from.first_name}!"

when /start/
      reply.text = "Hello, #{message.from.first_name}! /start /who"


    when /defined records management/
      reply.text = "It can be defined as"

 when /who/
      reply.text = bot_name

 

    else
      reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
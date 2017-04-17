
class MailController < ApplicationController
  require 'mailgun' 
  def lotte
  
  end
  
  def send_lotte
    @email = params[:email]
    @title = params[:title]
    @name = params[:name]
    @content = params[:content]
    
    mg_client = Mailgun::Client.new("key-00aeb39aa721bb9c83cdb493ef5f70ff")

        message_params =  {
                           from: @email,
                           to:   'guregure13@likelion.org',
                           subject: "[ "+ @name  +" ]" +@title,
                           text:    @content
                          }
        
        result = mg_client.send_message('sandbox32da620d23d24231b358290848d91fb5.mailgun.org', message_params).to_h!

      redirect_to "/mail/lotte"
  end
end

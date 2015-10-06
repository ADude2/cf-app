class MessageMailer < ApplicationMailer
  def message_me(name, email, subject, content)
    @name = name
    @email = email
    @subject = subject
    @content = content
    mail(from: @email,
         to: "info@crossrater.com",
         subject: @subject)
  end
end
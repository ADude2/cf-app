class PostmanWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(message_content)
    message_content = JSON.load(message_content)
    MessageMailer.message_me(message_content['name'], message_content['email'], message_content['subject'], message_content['content']).deliver_now
  end
end

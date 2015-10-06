require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
    it "tests sending a message" do
      msg = Message.new(
        name: "member",
        email: "member@example.com",
        subject: "Hi",
        content: "Hello from the internet"
      )

      email = MessageMailer.message_me(msg.name, msg.email, msg.subject, msg.content).deliver_now

      refute ActionMailer::Base.deliveries.empty?

      assert_equal ["info@crossrater.com"], email.to
      assert_equal ["member@example.com"], email.from
      assert_equal "Hi", email.subject
      expect(email.body.to_s).to have_content("Hello from the internet")
  end
end
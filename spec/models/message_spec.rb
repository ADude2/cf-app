require 'rails_helper'

RSpec.describe Message, type: :model do
  it "responds to name, email, subject and content" do
    msg = Message.new
    [:name, :email, :subject, :content].each do |attr|
      assert msg.respond_to? attr
    end
  end

  it "should accept valid attributes" do
    valid_attrs = {
      name: "member",
      email: "member@example",
      subject: "test",
      content: "okaythx"
    }

    msg = Message.new valid_attrs

    assert msg.valid?
  end

  it "attributes can't be blank" do
    msg = Message.new
    refute msg.valid?
  end
end
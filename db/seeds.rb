member = User.new(
  user_name: "MemberUser",
  email: "member@example.com",
  password: "helloworld"
)
member.skip_confirmation!
member.save!
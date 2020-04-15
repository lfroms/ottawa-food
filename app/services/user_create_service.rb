# frozen_string_literal: true
class UserCreateService < UseCaseService
  def execute(name:, email:, user_identity:)
    user = User.find_by(user_identity: user_identity)

    if user.nil?
      User.create(name: name, email: email, user_identity: user_identity)
    else
      user
    end
  end
end

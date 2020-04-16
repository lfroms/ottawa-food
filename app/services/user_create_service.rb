# frozen_string_literal: true
class UserCreateService < UseCaseService
  def execute(name:, email:, apple_identity:)
    user = User.find_by(apple_identity: apple_identity)

    if user.nil?
      User.create(name: name, email: email, apple_identity: apple_identity)
    else
      user
    end
  end
end

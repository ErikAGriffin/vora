module Hobbit
  module Hole

    def validate_passwords(password, confirmation)
      return false if confirmation != password
      return false if password.length < 7
      # return false if password !=~ /uppercaseregex/
      true
    end

    def create_user(email,password)
      new_user = User.new(email:email.downcase,password:password)
      new_user.valid? ? new_user.save : false
    end

  end
end

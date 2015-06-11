module Hobbit
  module Hole
    # Hmm.. I don't like this. Is there a better
    # place to have BCrypt included for password comparison?
    # Perhaps if I find a way to get actual User objects
    # from the database..
    include BCrypt

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

    def validate_login(stored,entered)
      Password.new(stored) == entered
    end

  end
end

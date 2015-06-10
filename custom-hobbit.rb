module Hobbit
  module Hole

    def validate_passwords(password, confirmation)
      return false if confirmation != password
      return false if password.length < 7
      # return false if password !=~ /uppercaseregex/
      true
    end


  end
end

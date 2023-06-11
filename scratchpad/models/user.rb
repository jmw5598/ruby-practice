module Models
  class User
    def initialize(username, password)
      @username = username
      @password = password
    end

    def authenticate(username, password)
      @username == username && @password == password
    end
  end
end

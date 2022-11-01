module RequestHelper
  def user_login(user)
      
      secret = ENV["SECRET"]
      
      encoding = 'HS256'
      
      request.headers["Authorization"] = 
        JWT.encode({ user_id: user.id }, secret, encoding)
  end
end
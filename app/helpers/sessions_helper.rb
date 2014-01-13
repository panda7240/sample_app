module SessionsHelper

  def sign_in(user)
    #cookies[:remember_token] = { value: user.remember_token, expires: 20.years.from_now.utc } cookies20年之后才失效
    #等同于下面一行代码
    session[:remember_token] = user.remember_token

    #在视图中可以这样用<%= current_user.name %>
    self.current_user = user

    #User.find_by_remember_token(cookies[:remember_token]) 可以通过它在页面中取到用户对象
  end



  def current_user=(user)
    @current_user = user
  end

  #当且仅当@current_user未定义时才进行赋值,避免重复查询数据库
  def current_user
    if session[:remember_token] == nil
      p '11111111111111111111111'
      return nil
    else
      current_user = User.find_by_remember_token(session[:remember_token])
      if current_user == nil
        p '22222222222222222222222'
        return nil
      else
        p '33333333333333333333333'
        return current_user
      end
    end

  end


  def sign_out
    self.current_user = nil
    #cookies.delete(:remember_token)
    session[:remember_token] = nil
  end

end

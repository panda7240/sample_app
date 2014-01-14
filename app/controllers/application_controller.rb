class ApplicationController < ActionController::Base
  protect_from_forgery

  #让控制器中也可以使用该类中的方法
  include SessionsHelper
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    #等同于@user = User.new(name: "Foo Bar", email: "foo@invalid", password: "foo", password confirmation: "bar")
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end



  def show
    @user = User.find(params[:id])
  end

end

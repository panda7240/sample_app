class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy


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

  #访问用户列表
  def index
    @users = User.paginate(page: params[:page])
  end



  def show
    @user = User.find(params[:id])
  end


  def edit
    #在过滤器correct_user中已经定义了@user所以不需要再定义了
    #@user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end


  def destroy
    user = User.find(params[:id])
    if !user.admin?
      user.destroy
      flash[:success] = "User destroyed."
    else
      flash[:error] = "Could not be destroyed."
    end

    redirect_to users_path
  end

  private
    def signed_in_user
      #等同
      #flash[:notice] = "Please sign in."
      #redirect_to signin_path
      #flash[:error]也可以用这样的简便形式,但是flash[:success]却不行
      unless signed_in?
        #存储想要登录后跳转的地址
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end




end

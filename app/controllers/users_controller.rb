class UsersController < ApplicationController
   before_action :authenticate_user!
  before_action :check_admin, only: [:admin, :destroy]


  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where(admin: false)
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def admin
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."

  end

  private


  def check_admin
    redirect_to root_path, alert: "警告！！先ほどのページへのアクセスを禁止しています！！！（You are not authorized to access this page.）" unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduce)
  end

end

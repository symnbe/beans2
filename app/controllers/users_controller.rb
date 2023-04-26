class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:admin, :destroy]
  before_action :require_admin, only:[:admin, :destroy]

  def index
    if current_user.admin?
      @users = User.released
    else
      @users = User.released.where.not(id: current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @followed_by_current_user = current_user.following?(@user)
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end
  # 管理者ページアクション
  def admin
      @users = User.all
  end
  # 公開する場合のアクション
  def release
    @user = User.find(params[:id])
    @user.released! unless @user.released?
    redirect_to user_admin_path, notice: "このアカウントは公開状態です！"
  end
  # 非公開する場合のアクション
  def nonrelease
    @user = User.find(params[:id])
    @user.nonreleased! unless @user.nonreleased?
    redirect_to user_admin_path, notice: "このアカウントは非公開状態です。"
  end

  private
  def check_admin
    redirect_to root_path, alert: "警告！！先ほどのページへのアクセスを禁止しています！！！（You are not authorized to access this page.）" unless current_user.admin?
  end

  def require_admin
    redirect_to root_path, alert: "この操作は管理者のみが許可されています。" unless current_user.admin?
  end
  
  def is_matching_login_user
    
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduce)
  end

end

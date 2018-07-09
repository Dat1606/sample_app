class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit , :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :load_user, only: [:destroy, :show]
before_action :admin_user, only: :destroy

  def index
    @users = User.order(:name).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "check_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @microposts = @user.microposts.page params[:page]
  end

  def edit; end

  def update
    if @user.update_attributes user_params
    flash[:success] = t "profile_updated"
    redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_to users_url
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:danger] = t "user_not_found"
      redirect_to users_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user?(@user)
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

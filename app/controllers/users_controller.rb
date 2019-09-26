class UsersController < ApplicationController
  before_action :set_id ,only:[ :edit,:update,:show]
  before_action :require_same_user,only: [:edit,:update]
  def new
    @user=User.new
  end
  def index
    @user=User.all
  end
  def create
    # debugger
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:success]="Welcome to the aplha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    # @user=User.find(params[:id])
  end
  def update
    # @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="Your Account was Updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  def show
    # @user=User.find(params[:id])

  end
  private
  def user_params
    params.require(:user).permit(:username,:email,:password)

  end
  def set_id
    @user=User.find(params[:id])
  end
  def require_same_user
    if current_user !=@user
    flash[:danger]="you can only edit your profile"
      redirect_to root_path
      end
  end
end
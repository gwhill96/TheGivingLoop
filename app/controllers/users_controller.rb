class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    authorize @user
    @user = User.find(current_user.id)
    if @user.update!(user_params)
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user
    @user.destroy
    # redirect_to users_path, status: :see_other
    redirect_to root_path(@root)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end

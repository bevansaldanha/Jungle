class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end 

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    puts user,'here'
    if user.authenticate(password)
      user
    else
      nil
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

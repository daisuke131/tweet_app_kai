class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  # def login
  #   @user = User.find_by(email: params[:email], password: params[:password])
  #   if @user
  #     flash[:notice] = "ログインしました"
  #     redirect_to("/posts/index")
  #   else
  #     render("users/login_form")
  #   end
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.image_name = "default_user.jpg"
  #   if @user.save
  #     flash[:notice] = "ユーザー登録が完了しました"
  #     redirect_to(users_path)
  #   else
  #     render('new')
  #   end  
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   image = user_params[:image]

  #   if image
  #   @user.image_name = "#{@user.id}.jpg"
  #   File.binwrite("public/user_mages/#{@user.image_name}", image.read)
  #   end

  #   @user.name = user_params[:name]
  #   @user.email = user_params[:email]
  #   if @user.update(user_params)
  #     flash[:notice] = "編集しました"
  #     redirect_to(users_path)
  #   else
  #     render('edit')
  #   end  
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   flash[:notice] = "投稿を削除しました"
  #   redirect_to(users_path)
  # end

  # private
  # def user_params
  #   # params.require(:user).permit(:name, :email, :password)
  #   params.require(:user).permit(:name, :email, :password, :image)
  # end

  # def login_user_params
  #   params.require(:user).permit(:email, :password)
  # end

end

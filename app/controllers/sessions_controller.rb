class SessionsController < ApplicationController

  def index
    @user = current_user
    @post = current_user.posts.build if logged_in?
    @posts = @user.posts.paginate(page: params[:page])
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: [current_user.id, current_user.following.ids], owner_type: "User")


  end

	def create
  	user = User.find_by(:email => params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to '/dashboard'
  	else
  		redirect_to :back
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end
end

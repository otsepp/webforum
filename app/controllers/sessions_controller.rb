class SessionsController < ApplicationController
  
	def new
		session[:return_url] = params[:return_url]
		render :new
	end
	
	def create
		user = User.find_by username: params[:username]
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to session[:return_url], notice:"Welcome #{params[:username]}"
      		else
			redirect_to :back, notice: "Username and/or password mismatch"
	      	end
	end

	def destroy
		#session[:user_id] = nil
		reset_session
		redirect_to :back
	end

end

class SessionsController < ApplicationController
  
	def new
		session[:return_url] = params[:return_url]
		render :new
	end
	
	def create
		user = User.find_by username: params[:username]
		if user.nil?
			redirect_to :back, notice:"User #{params[:username]} does not exist"
	  	else
        		session[:user_id] = user.id
			redirect_to session[:return_url], notice:"Welcome #{params[:username]}"
      		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :back
	end

end

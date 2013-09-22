module UsersHelper
	@text=""
	def printError (id_temp)
		if (@user.errors.messages[id_temp].length > 0)
			@text =""
			@user.errors.full_messages_for(id_temp).each do |msg|
				@text += msg + "\n\n\n"
			end
			render text: @text
		else
			return nil
		end
	end

	def require_session

		if session[:userid]
			return true
		else
			redirect_to root_url
		end
	end
end

module DriftmapsHelper
	def user_is_home user
		# byebug
		if !logged_in? || current_user.nil? || user.nil?
			return false
		elsif current_user.id == user.id
			return true
		end
	end
end

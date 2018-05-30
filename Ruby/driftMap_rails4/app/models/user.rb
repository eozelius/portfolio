class User < ActiveRecord::Base
	has_one :driftmap, dependent: :destroy

	# Class properties
	mount_uploader :profile_pic, PictureUploader
	attr_accessor :remember_token, :activation_token, :password_reset_token
	before_save 	:downcase_email
	before_create :create_activation_digest

	validates :first_name, presence: true, :length => { minimum: 2, maximum: 55 }
        validates :last_name, presence: true, :length => { minimum: 2, maximum: 55 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, :length => { minimum: 7, maximum: 255 },
						:format => { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	validate  :picture_size

	# Class Methods
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		# byebug
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																									BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# generates new token that can be used to. cookies & tokens.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def activate
		update_attribute(:activated,		true)
		update_attribute(:activated_at,	Time.zone.now)
	end

	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end

	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now
	end

	def create_password_reset_digest
		self.password_reset_token = User.new_token
		update_attribute(:reset_digest, User.digest(password_reset_token))
		update_attribute(:reset_sent_at, 		 Time.zone.now)
	end

	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end

	private

		def downcase_email
			self.email = email.downcase
		end

		def create_activation_digest
			self.activation_token  = User.new_token
			self.activation_digest = User.digest( activation_token )
		end

		def picture_size
			
			#if profile_pic.size > 3.megabytes
		#		errors.add(:picture, "Photo must be less than 5MB.")
	#		end
			true 
		end
end

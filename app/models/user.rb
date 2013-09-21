class User < ActiveRecord::Base
	has_many :todos
	attr_accessor :password,:password_confirmation
	before_save :encrypt_password
	validates_presence_of :email
	validates_presence_of :password
	validates_presence_of :password_confirmation
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	def self.authenticate(email, password)

		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
			user
		else
			nil
		end

	end


	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
		end
	end
end

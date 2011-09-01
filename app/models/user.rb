class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def admin?
    group.split(",").include?("admin")
  end

  def gravatar_link
    digest = Digest::MD5.hexdigest(self.email.downcase)
    "http://www.gravatar.com/avatar/#{digest}?s=35&d=mm"
  end
end

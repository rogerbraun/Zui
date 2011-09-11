class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :projects
  has_many :collaborations
  has_many :shared_projects, :through => :collaborations, :source => :project
  has_many :comments

  def admin?
    group && group.split(",").include?("admin")
  end

  def gravatar_link(size = 35, default = "identicon")
    digest = Digest::MD5.hexdigest(self.email.downcase)
    "http://www.gravatar.com/avatar/#{digest}?s=#{size}&d=#{default}"
  end
end

class SignUp
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include Mongoid::Validations
  
  attr_accessor :user, :nickname, :email
  
  delegate :persisted?, :nickname, :nickname=, :email, :email=, :id, to: :user
  
  #This is for uniqueness validation could wrap in a module
  delegate :new?, :relations, :embedded?, :new_record?, to: :user
  
  def self.where(*args)
    User.where *args
  end
  #end for uniquness
            
  validates :nickname,
            uniqueness: true,
            presence: true,
            length: { minimum: 5, maximum: 8 }
  
  validates :email,
            presence: true
  
  
  def initialize(params = {})
    self.nickname = params.try(:[],:nickname)
    self.email = params.try(:[],:email)
  end
  
  def save
    user.save if valid?
  end
  
  def user
    @user ||= User.new
  end
end
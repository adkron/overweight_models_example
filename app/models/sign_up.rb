class SignUp
  include BackedModel::Base
  backing_model :user
  uses_uniquness_validations_against :user
  attr_accessor :nickname, :email
            
  validates :nickname,
            uniqueness: {message:'is already taken'},
            presence: true,
            length: { minimum: 5, maximum: 8 }
  
  validates :email,
            presence: true
  
  
  def initialize(params = {})
    self.nickname = params.try(:[],:nickname)
    self.email = params.try(:[],:email)
  end
  
  def complete
    if valid?
      user.nickname = nickname
      user.email = email
      user.save
    end
  end
  
  def user
    @user ||= User.new
  end
end
class Confirmation
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::Validations
  
  attr_accessor :user
  
  delegate :persisted?, :id, :attributes=, :password, :password_confirmation, to: :user
  
  validates :password,
            confirmation: true,
            presence: true
            
  def self.find(id)
    Confirmation.new User.find(id)
  end
  
  def initialize(user)
    self.user = user
  end
  
  def complete
    user.save if valid?
  end
end
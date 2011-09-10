class Confirmation
  include BackedModel::Base
  backing_model :user
  
  attr_accessor :password
  
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
    user.update_attributes :password => self.password if valid?
  end
  
  #move this to a module
  def attributes=(attributes)
    attributes.each { |attr_name, value| send(:"#{attr_name}=", value) }
  end
end
class Confirmation
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::Validations
  
  attr_accessor :user, :password
  
  delegate :persisted?, :id, to: :user
  
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
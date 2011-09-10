class User
  include Mongoid::Document
  
  field :nickname, type: String
  field :email, type: String
  field :password, type: String
  field :sign_in_count, type: Integer, default: 0
  
  validates :password,
            confirmation: true,
            presence: { on: :update }
            
  validates :nickname,
            uniqueness: true,
            presence: true,
            length: { minimum: 5, maximum: 8 }
  
  validates :email,
            presence: true
            
  def increment_sign_in_count
    self.sign_in_count += 1
    self.save
  end
end
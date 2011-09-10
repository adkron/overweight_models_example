class User
  include Mongoid::Document
  
  field :nickname, type: String
  field :email, type: String
  field :password, type: String
  field :sign_in_count, type: Integer, default: 0
  
  scope :sign_up, lambda {|nickname, email| where(:nickname => nickname, :email => email) }
            
  def increment_sign_in_count
    self.sign_in_count += 1
    self.save
  end
end
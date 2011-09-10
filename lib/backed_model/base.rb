require 'backed_model/bare'
require 'backed_model/uniqueness_validatable'

module BackedModel
  module Base
    extend ActiveSupport::Concern
    
    included do
      include BackedModel::Bare
      include BackedModel::UniquenessValidatable
    end
  end
end
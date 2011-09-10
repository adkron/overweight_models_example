module BackedModel
  module Bare
    extend ActiveSupport::Concern
    
    included do
      include ActiveModel::Conversion
      extend ActiveModel::Naming
      include Mongoid::Validations
      
      def attributes=(attributes)
        attributes.each { |attr_name, value| send(:"#{attr_name}=", value) }
      end
    end
    
    module ClassMethods
      def backing_model(backing_model)
        attr_accessor backing_model
        delegate :persisted?, :id, to: backing_model
      end
    end
  end
end
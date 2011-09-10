module BackedModel
  module UniquenessValidatable
    extend ActiveSupport::Concern
    
    module ClassMethods
      def uses_uniquness_validations_against backing_model
        delegate :new?, :relations, :embedded?, :new_record?, to: backing_model

        def self.where(*args)
          User.where *args
        end
      end
    end
  end
end
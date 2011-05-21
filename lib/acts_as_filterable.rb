require 'active_record'

module ActsAsFilterable #:nodoc:
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_filterable(*filters)
      class_inheritable_array :filters
      self.filters = filters
      extend ActsAsFilterable::SingletonMethods
    end
  end

  module SingletonMethods
    def filter(options)
      options.reject {|k, v| !filters.include?(k.to_sym)}.inject(self) do |scope, option|
        if self.respond_to?(option[0].to_sym)
          scope.send(option[0].to_sym, option[1])
        else
          scope.send(:where, "#{option[0]} LIKE ?", option[1])
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActsAsFilterable)
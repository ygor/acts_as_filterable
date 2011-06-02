require 'active_record'

module ActsAsFilterable #:nodoc:
  extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_filterable(*filterables)
      class_inheritable_array :filterables
      self.filterables = filterables
      
      scope :filtered, lambda {|filters|
        filters.reject {|k, v| !filterables.include?(k.to_sym)}.inject(self.scoped) do |scope, filter|
          if columns.map(&:name).include?(filter[0].to_s)
            scope.send(:where, "#{filter[0]} LIKE ?", filter[1])
          elsif scope.respond_to?(filter[0].to_sym)
            scope.send(filter[0].to_sym, filter[1])
          else
            scope
          end
        end
      }
    end
  end
end

ActiveRecord::Base.send(:include, ActsAsFilterable)
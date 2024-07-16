require "snm/enum/transition/version"
require "snm/enum/transition/railtie"

module Snm
  module Enum
    module Transition
      extend ActiveSupport::Concern

      def self.included(base)
        base.class_eval do
          validate :ensure!
          base.extend ClassMethods
          @enum_transition_columns=[]
        end
      end

      module ClassMethods
        def snm_enum_transitions column_name, from_transitions, to_transitions
          from_transitions.each do |ft|
            to_transitions.each do |tt|
              define_method ("snm_#{ft}_to_#{tt}") do
                true
              end
            end
          end
          @enum_transition_columns.push(column_name).uniq!
        end
      end

      def ensure!
        self.class.name.constantize.instance_variable_get('@enum_transition_columns').each do |column|
          if !self.new_record?  && self.send("#{column}_changed?")
            unless self.respond_to? "snm_#{self.send("#{column}_was")}_to_#{self.send("#{column}")}"
              self.errors.add(:base, "#{column.upcase} can't be changed from #{self.send("#{column}_was")} to #{self.send("#{column}")}")
            end
          end
        end
      end

    end
  end
end

module Selectable
  include ActiveSupport::Concern

  module ClassMethods
    def as_select_collection(collection = self.all, exclusions = [], options = {})
      collection.map do |object|
        unless exclusions.include? object
          [object_title(object), object.id]
        end
      end.reject(&:nil?)
    end

    def as_select_name_only(collection = self.all, exclusions = [], options = {})
      collection.map do |object|
        unless exclusions.include? object
          [object_title(object)]
        end
      end.reject(&:nil?)
    end

    private
    def object_title(obj)
      if defined?(obj.full_name)
        obj.full_name
      elsif defined?(obj.title) 
        obj.title
      else
        obj.name
      end
    end
  end

  def self.included(base)
    base.send :extend, ClassMethods
  end

end

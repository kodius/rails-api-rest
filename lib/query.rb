# frozen_string_literal: true

class Query

  @model = nil

  class << self

    attr_reader :model

    # rubocop:disable Naming/AccessorMethodName
    def set_model(model)
      @model = model
    end
    # rubocop:enable Naming/AccessorMethodName

    def all(relation = nil)
      extended_relation(relation)
    end

    def inherited(child)
      child.extend(MetaMethods)
    end

    module MetaMethods
      def method_missing(method_name, *args, &block)
        if extended_relation.respond_to?(method_name)
          extended_relation.public_send(method_name, *args)
        else
          super
        end
      end

      def respond_to_missing?(method_name, *args)
        super || extended_relation.respond_to?(method_name, *args)
      end
    end

    private

    def base_relation
      model_class.all
    end

    def scopes
      model ? self::Scopes : [self::Scopes, superclass::Scopes]
    end

    def extended_relation(relation = nil)
      (relation || base_relation).extending(scopes)
    end

    def model_class
      model || superclass.model
    end

  end

  module Scopes
    def find_by!(args)
      find_by(args).tap do |object|
        raise NotFoundError, args unless object
      end
    end

    def last!
      last.tap do |object|
        raise NotFoundError, nil unless object
      end
    end

    def find_by_excluding_id(args, id)
      not_id(id).find_by(args)
    end

    def not_id(id)
      where.not(id: id)
    end

    def by_id(id)
      where(id: id)
    end

    def multiple_or(where_clauses)
      return self if where_clauses.blank?

      where_clauses.inject(self) do |resulting_relation, where_clause|
        resulting_relation.or(where_clause)
      end
    end

    def filter(attributes = {})
      attributes_mapped = attributes.except(:operator).map do |key, value|
        filter_value = Search::Value.new(key, value, arel_table.name.singularize.classify.constantize)
        Search::Matcher.new(filter_value).build
      end.reduce(&attributes[:operator])

      where(attributes_mapped)
    end

    def cursor(attributes)
      offset(attributes[:offset]).limit(attributes[:limit])
    end
  end

end

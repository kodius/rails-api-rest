# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `jsonapi-serializer` gem.
# Please instead update this file by running `bin/tapioca gem jsonapi-serializer`.

# source://jsonapi-serializer//lib/fast_jsonapi.rb#5
module FastJsonapi
  class << self
    # Calls either a Proc or a Lambda, making sure to never pass more parameters to it than it can receive
    #
    # @param proc [Proc] the Proc or Lambda to call
    # @param *params [Array<Object>] any number of parameters to be passed to the Proc
    # @return [Object] the result of the Proc call with the supplied parameters
    #
    # source://jsonapi-serializer//lib/fast_jsonapi/helpers.rb#8
    def call_proc(proc, *params); end
  end
end

# source://jsonapi-serializer//lib/fast_jsonapi/attribute.rb#4
class FastJsonapi::Attribute < ::FastJsonapi::Scalar; end

# source://jsonapi-serializer//lib/fast_jsonapi/link.rb#4
class FastJsonapi::Link < ::FastJsonapi::Scalar; end

# source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#7
class FastJsonapi::MandatoryField < ::StandardError; end

# source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#14
module FastJsonapi::ObjectSerializer
  extend ::ActiveSupport::Concern
  include ::FastJsonapi::SerializationCore

  mixes_in_class_methods ::FastJsonapi::SerializationCore::ClassMethods
  mixes_in_class_methods ::FastJsonapi::ObjectSerializer::ClassMethods

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#30
  def initialize(resource, options = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#57
  def hash_for_collection; end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#45
  def hash_for_one_record; end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#36
  def serializable_hash; end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#36
  def to_hash; end

  private

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#96
  def deep_symbolize(collection); end

  # @raise [ArgumentError]
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#77
  def process_options(options); end
end

# source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#0
module FastJsonapi::ObjectSerializer::ClassMethods
  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#224
  def add_relationship(relationship); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#203
  def attribute(*attributes_list, &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#203
  def attributes(*attributes_list, &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#249
  def belongs_to(relationship_name, options = T.unsafe(nil), &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#174
  def cache_options(cache_options); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#295
  def compute_id_method_name(custom_id_method_name, id_method_name_from_relationship, polymorphic, serializer, block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#258
  def create_relationship(base_key, relationship_type, options, block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#189
  def deprecated_cache_options(cache_options); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#316
  def fetch_polymorphic_option(options); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#239
  def has_many(relationship_name, options = T.unsafe(nil), &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#244
  def has_one(relationship_name, options = T.unsafe(nil), &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#118
  def inherited(subclass); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#112
  def is_collection?(resource, force_is_collection = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#325
  def link(*params, &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#254
  def meta(meta_name = T.unsafe(nil), &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#133
  def reflected_record_type; end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#153
  def run_key_transform(input); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#303
  def serializer_for(name); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#170
  def set_id(id_name = T.unsafe(nil), &block); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#141
  def set_key_transform(transform_name); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#166
  def set_type(type_name); end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#161
  def use_hyphen; end

  # source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#340
  def validate_includes!(includes); end
end

# source://jsonapi-serializer//lib/fast_jsonapi/object_serializer.rb#18
FastJsonapi::ObjectSerializer::TRANSFORMS_MAPPING = T.let(T.unsafe(nil), Hash)

# source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#2
class FastJsonapi::Relationship
  # @return [Relationship] a new instance of Relationship
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#5
  def initialize(owner:, key:, name:, id_method_name:, record_type:, object_method_name:, object_block:, serializer:, relationship_type:, polymorphic:, conditional_proc:, transform_method:, links:, meta:, cached: T.unsafe(nil), lazy_load_data: T.unsafe(nil)); end

  # Returns the value of attribute cached.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def cached; end

  # Returns the value of attribute conditional_proc.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def conditional_proc; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#55
  def fetch_associated_object(record, params); end

  # Returns the value of attribute id_method_name.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def id_method_name; end

  # @return [Boolean]
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#61
  def include_relationship?(record, serialization_params); end

  # Returns the value of attribute key.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def key; end

  # Returns the value of attribute lazy_load_data.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def lazy_load_data; end

  # Returns the value of attribute links.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def links; end

  # Returns the value of attribute meta.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def meta; end

  # Returns the value of attribute name.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def name; end

  # Returns the value of attribute object_block.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def object_block; end

  # Returns the value of attribute object_method_name.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def object_method_name; end

  # Returns the value of attribute owner.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def owner; end

  # Returns the value of attribute polymorphic.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def polymorphic; end

  # Returns the value of attribute record_type.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def record_type; end

  # Returns the value of attribute relationship_type.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def relationship_type; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#43
  def serialize(record, included, serialization_params, output_hash); end

  # Returns the value of attribute serializer.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def serializer; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#69
  def serializer_for(record, serialization_params); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#96
  def static_record_type; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#91
  def static_serializer; end

  # Returns the value of attribute transform_method.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#3
  def transform_method; end

  private

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#148
  def add_links_hash(record, params, output_hash); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#158
  def add_meta_hash(record, params, output_hash); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#226
  def compute_static_record_type; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#182
  def compute_static_serializer; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#138
  def fetch_id(record, params); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#130
  def id_hash(id, record_type, default_return = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#119
  def id_hash_from_record(record, params); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#124
  def ids_hash(ids, record_type); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#103
  def ids_hash_from_record_and_relationship(record, params = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#174
  def initialize_static_serializer; end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#217
  def record_type_for(record, serialization_params); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#166
  def run_key_transform(input); end

  # source://jsonapi-serializer//lib/fast_jsonapi/relationship.rb#213
  def serializer_for_name(name); end
end

# source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#2
class FastJsonapi::Scalar
  # @return [Scalar] a new instance of Scalar
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#5
  def initialize(key:, method:, options: T.unsafe(nil)); end

  # Returns the value of attribute conditional_proc.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#3
  def conditional_proc; end

  # @return [Boolean]
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#21
  def conditionally_allowed?(record, serialization_params); end

  # Returns the value of attribute key.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#3
  def key; end

  # Returns the value of attribute method.
  #
  # source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#3
  def method; end

  # source://jsonapi-serializer//lib/fast_jsonapi/scalar.rb#11
  def serialize(record, serialization_params, output_hash); end
end

# source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#9
module FastJsonapi::SerializationCore
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::FastJsonapi::SerializationCore::ClassMethods
end

# source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#0
module FastJsonapi::SerializationCore::ClassMethods
  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#43
  def attributes_hash(record, fieldset = T.unsafe(nil), params = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#164
  def get_included_records(record, includes_list, known_included_objects, fieldsets, params = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#121
  def id_from_record(record, params); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#29
  def id_hash(id, record_type, default_return = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#37
  def links_hash(record, params = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#64
  def meta_hash(record, params = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#155
  def parse_includes_list(includes_list); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#102
  def record_cache_options(options, fieldset, includes_list, params); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#68
  def record_hash(record, fieldset, includes_list, params = T.unsafe(nil)); end

  # source://jsonapi-serializer//lib/fast_jsonapi/serialization_core.rb#53
  def relationships_hash(record, relationships = T.unsafe(nil), fieldset = T.unsafe(nil), includes_list = T.unsafe(nil), params = T.unsafe(nil)); end
end

# source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#3
module JSONAPI; end

# source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#4
module JSONAPI::Serializer
  include ::FastJsonapi::SerializationCore
  include ::FastJsonapi::ObjectSerializer

  mixes_in_class_methods ::FastJsonapi::SerializationCore::ClassMethods
  mixes_in_class_methods ::FastJsonapi::ObjectSerializer::ClassMethods

  class << self
    # TODO: Move and cleanup the old implementation...
    #
    # source://jsonapi-serializer//lib/jsonapi/serializer.rb#6
    def included(base); end
  end
end

# source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#5
class JSONAPI::Serializer::Error < ::StandardError; end

# source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#7
class JSONAPI::Serializer::UnsupportedIncludeError < ::JSONAPI::Serializer::Error
  # @return [UnsupportedIncludeError] a new instance of UnsupportedIncludeError
  #
  # source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#10
  def initialize(include_item, klass); end

  # Returns the value of attribute include_item.
  #
  # source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#8
  def include_item; end

  # Returns the value of attribute klass.
  #
  # source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#8
  def klass; end

  # source://jsonapi-serializer//lib/jsonapi/serializer/errors.rb#16
  def message; end
end

# source://jsonapi-serializer//lib/fast_jsonapi/railtie.rb#5
class Railtie < ::Rails::Railtie; end

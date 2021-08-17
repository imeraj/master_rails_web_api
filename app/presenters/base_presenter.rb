class BasePresenter
  CLASS_ATTRIBUTES = {
    build_with: :build_attributes,
    related_to: :relations,
    sort_by: :sort_attributes,
    filter_by: :filter_attributes
  }.freeze

  CLASS_ATTRIBUTES.each { |_k, v| instance_variable_set("@#{v}", []) }

  class << self
    attr_accessor *CLASS_ATTRIBUTES.values

    CLASS_ATTRIBUTES.each { |k, v| define_method(k) { |*args| instance_variable_set("@#{v}", args.map(&:to_s)) } }
  end

  attr_accessor :object, :params, :data

  def initialize(object, params, options = {})
    @object = object
    @params = params
    @data = HashWithIndifferentAccess.new
    @options = options
  end

  def as_json(*)
    @data
  end
end
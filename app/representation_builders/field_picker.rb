class FieldPicker

  def initialize(presenter)
    @presenter = presenter
    @fields = @presenter.params[:fields]  # fields comes from controller params
  end

  def pick
    (validate_fields || pickable).each do |field|
      value = (@presenter.respond_to?(field) ? @presenter : @presenter.object).send(field)
      @presenter.data[field] = value
    end

    @presenter
  end

  def validate_fields
    return if @fields.blank?

    validated = @fields.split(",").select {|f| pickable.include?(f) }
    validated.any? ? validated : nil
  end

  def pickable
    @pickable ||= @presenter.class.build_attributes
  end
end
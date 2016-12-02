class Definition
attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_method(:description) do
    @description
  end
end

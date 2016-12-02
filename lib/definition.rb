class Definition
  attr_reader(:description)

  @@definitions = []

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = @@definitions.length() + 1
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_method(:id) do
    @id
  end
  define_singleton_method(:find) do |id|
    find_definition = nil
    @@definitions.each() do |definition|
      if definition.id() == id
        find_definition = definition
      end
    end
    find_definition
  end
end

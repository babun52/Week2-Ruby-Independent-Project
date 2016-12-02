class Word
  attr_reader(:vocab)
  @@words = []

  define_method(:initialize) do |attributes|
    @vocab = attributes.fetch(:vocab)
  end

  define_method(:vocab) do
    @vocab
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end
end

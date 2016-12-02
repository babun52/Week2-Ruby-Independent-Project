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
end

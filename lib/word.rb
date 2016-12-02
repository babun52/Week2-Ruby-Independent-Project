class Word
  attr_reader(:vocab)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:vocab)
  end

  define_method(:vocab) do
    @word
  end
end

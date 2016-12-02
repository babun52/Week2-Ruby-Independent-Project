class Word
  attr_reader(:vocab)

  @@words = []

  define_method(:initialize) do |attributes|
    @vocab = attributes.fetch(:vocab)
    @id = @@words.length() + 1
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

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    find_word = nil
    @@words.each() do |word|
      if word.id() == identification
        find_word = word
      end
    end
    find_word
  end
end

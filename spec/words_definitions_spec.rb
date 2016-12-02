require('rspec')
require('word')
require('definition')

describe(Word) do
  describe('#vocab') do
    it('will return a word/vocabulary') do
      test_word = Word.new(:vocab => "Epicodus")
      expect(test_word.vocab()).to(eq("Epicodus"))
    end
  end
end

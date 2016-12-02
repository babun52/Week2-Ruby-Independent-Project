require('rspec')
require('word')
require('definition')

describe(Word) do
  describe('#vocab') do
    it('will return a word/vocabulary') do
      test_word = Word.new({:vocab => "Epicodus"})
      expect(test_word.vocab()).to(eq("Epicodus"))
    end
  end
  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the word that user input into an empty array') do
      test_word = Word.new({:vocab => "Epicodus"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end
end

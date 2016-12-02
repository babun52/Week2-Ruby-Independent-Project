require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

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
  describe('.clear') do
    it('empties all input words out from the array') do
      test_word = Word.new({:vocab => "Epicodus"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
  describe('#id') do
    it('gives the identification of the word') do
      test_word = Word.new({:vocab => "Epicodus"})
      expect(test_word.id()).to(eq(1))
    end
  end
  describe('.find') do
    it('will find and return a word by its id number') do
      test_word = Word.new({:vocab => "Epicodus"})
      test_word.save()
      test_word2 = Word.new({:vocab => "programmer"})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end

describe(Definition) do
  describe('#description') do
    it('returns the definition of a word') do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"})
      expect(test_definition.description()).to(eq("a school where people from all walks of life come together to learn web and mobile development"))
    end    
  end
end

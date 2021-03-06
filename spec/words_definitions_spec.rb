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
  describe('#names') do
    it("initially returns an empty array of definition for the word") do
      test_word = Word.new({:vocab => "Epicodus"})
      expect(test_word.names()).to(eq([]))
    end
  end
  describe('#add_definition') do
    it("adds a new definition to a word") do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"})
      test_word = Word.new({:vocab => "Epicodus"})
      test_word.add_definition(test_definition)
      expect(test_word.names()).to(eq([test_definition]))
    end
  end
end

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe('#description') do
    it('returns the definition of a word') do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"})
      expect(test_definition.description()).to(eq("a school where people from all walks of life come together to learn web and mobile development"))
    end
  end
  describe('.all') do
    it('is also empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves a definition to the array') do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end
  describe('.clear') do
    it('erases all of the saved definitions') do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"}).save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
  describe('#id') do
    it('give an id to an inputted definition') do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"})
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end
  describe('.find') do
    it('returns the definition by its id') do
      test_definition = Definition.new({:description => "a school where people from all walks of life come together to learn web and mobile development"})
      test_definition.save()
      test_definition2 = Definition.new({:description => "a person who writes code for computer programs"})
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end
end

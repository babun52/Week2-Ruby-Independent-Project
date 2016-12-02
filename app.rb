require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  vocab = params.fetch('vocab')
  new_word = Word.new(:vocab => vocab)
  new_word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch("id").to_i())
  erb(:definition)
end

get('/definitions/:id/words/new') do
  @word = Word.find(params.fetch("id").to_i())
  erb(:definitions_form)
end

get('/definitions') do
  @definitions = Definition.all()
  erb(:definitions)
end

post('/definitions') do
  define = params.fetch('define')
  new_definition = Definition.new(:description => define)
  new_definition.save()
  @word.add_definition(new_definition)
  erb(:definitions)
end

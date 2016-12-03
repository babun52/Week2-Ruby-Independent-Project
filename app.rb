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

post('/words') do
  vocab = params.fetch('vocab')
  Word.new(:vocab => vocab).save()
  @words = Word.all()
  erb(:words)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definitions_form)
end

post('/definitions') do
  define = params.fetch('define')
  @definition = Definition.new({:description => define})
  @definition.save()
  @definitions = Definition.all()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:definitions)
end

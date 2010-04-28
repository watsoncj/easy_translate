require File.dirname(__FILE__) + '/spec_helper'

describe 'translate_batch' do

  it 'should be able to translate a single thing as batch' do
    translations = EasyTranslate.translate_batch('hello', :from => :english, :to => :spanish)
    translations.should == ['¡Hola']
  end

  it 'should be able to take multiple texts at the same time and translate them' do
    translations = EasyTranslate.translate_batch(['Hello', "Goodbye"], :from => :en, :to => :es)
    translations.should == ['¡Hola', 'Despedida']
  end
  
  it 'should be able to take multiple languages to translate to, and do so' do
    translations = EasyTranslate.translate_batch('hello', :from => :en, :to => [:french, :german, :spanish, :italian])
    translations.should == ['bonjour', 'hallo', '¡Hola', 'ciao']
  end
  
  it 'should be able to take multiple languages, and multiple strings ... and handle that ugliness' do
    translations = EasyTranslate.translate_batch(['hello', 'goodbye'], :from => :en, :to => [:spanish, :italian])
    translations.should == ['¡Hola', 'despedida', 'ciao', 'addio']
  end

end
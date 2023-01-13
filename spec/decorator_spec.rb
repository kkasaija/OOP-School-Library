require './spec_helper'

describe Nameable do
  before :each do
    @name = Nameable.new
  end

  describe '#new' do
    it 'Should return nameable object' do
      expect(@name).to be_an_instance_of Nameable
    end
  end

  describe '#correct_name' do
    it 'raises a NotImplementedError' do
      expect { @name.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe BaseDecorator do
  before :each do
    @decor = BaseDecorator.new('name')
  end

  describe '#new' do
    it 'Should return basedecorator object' do
      expect(@decor).to be_an_instance_of BaseDecorator
    end
  end

  describe '#new' do
    it 'Should return nameable object' do
      expect(@decor.nameable).to eql 'name'
    end
  end
end

describe CapitalizeDecorator do
  before :each do
    @cap_decor = CapitalizeDecorator.new('name')
  end

  describe '#new' do
    it 'Should return basedecorator object' do
      expect(@cap_decor).to be_an_instance_of CapitalizeDecorator
    end
  end

  describe '#new' do
    it 'Should return nameable object' do
      expect(@cap_decor.nameable).to eql 'name'
    end
  end
end

describe TrimmerDecorator do
  before :each do
    @trim_decor = TrimmerDecorator.new('name')
  end

  describe '#new' do
    it 'Should return basedecorator object' do
      expect(@trim_decor).to be_an_instance_of TrimmerDecorator
    end
  end

  describe '#new' do
    it 'Should return nameable object' do
      expect(@trim_decor.nameable).to eql 'name'
    end
  end
end

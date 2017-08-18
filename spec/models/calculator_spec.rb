require 'rails_helper'

RSpec.describe Calculator, type: :model do
  context "a mathematical formula" do
  end

  before(:each) do
    begin
      @filename = 'tmp/t_history'
      File.delete(@filename)
    rescue
    end
  end

  describe '#to_s' do
    it "parses input and displays itself" do
      c = Calculator.new('2 ** 4')
      # binding.pry
      expect(c.to_s).to eql("2.0 ** 2.0 = 16.0")
    end
  end

  describe '#answer' do
    it "gets answer" do
      c = Calculator.new('2 ** 4')
      # binding.pry
      expect(c.answer).to be_within(0.1).of(16)
    end
  end

  describe '.read' do
    it 'read new file' do
      lines = Calculator.read(@filename)
      expect(lines.size).to equal(0)
    end

    it 'read existing file' do
      c = Calculator.new('2 ** 4')
      Calculator.write(c, @filename)
      lines = Calculator.read(@filename)
      expect(lines.size).to equal(1)
    end
  end

  describe '.write' do
    it 'writes to a new file' do
      c = Calculator.new('2 ** 4')
      Calculator.write(c, @filename)
      f = File.read(@filename)
      expect(f).to eql("2.0 ** 4.0 = 16.0\n")
    end

    it 'writes to an existing file' do
      c = Calculator.new('2 ** 4')
      Calculator.write(c, @filename)
      Calculator.write(c, @filename)
      f = File.read(@filename)
      expect(f).to eql("2.0 ** 4.0 = 16.0\n2.0 ** 4.0 = 16.0\n")
    end
  end
end

require 'spec_helper'

describe LLT::LatinBuilder do

  it 'should have a version number' do
    LLT::LatinBuilder::VERSION.should_not be_nil
  end

  describe "#create_random_sentence" do
    it 'returns an array with LLT::Form objects' do
      LLT::LatinBuilder.new.create_random_sentence.should be_kind_of Array
    end
  end

end

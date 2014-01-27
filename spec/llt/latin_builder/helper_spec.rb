require 'spec_helper'

describe LLT::LatinBuilder::Helper do
  let(:helper) { LLT::LatinBuilder::Helper }

  class Dummy
    include LLT::LatinBuilder::Helper

    def entries
      [StemDatabase::DbNoun.new({}),
      StemDatabase::DbVerb.new({}),
      StemDatabase::DbNoun.new({})
      ]
    end
  end

  describe "returns array of StemDatabase objects" do
    it "with nouns" do
      Dummy.new.noun.size.should == 2
    end

    it "with verbs" do
      Dummy.new.verb.size.should == 1
    end
  end
end


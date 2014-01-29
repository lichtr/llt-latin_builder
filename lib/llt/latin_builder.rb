require "llt/latin_builder/version"

module LLT
  class LatinBuilder
    require_relative 'latin_builder/helper'
    require_relative 'latin_builder/sentence_creator'
    include LLT::LatinBuilder::Helper

    def initialize(*types)
      LLT::LatinBuilder::Types.add_types(types)

      LLT::LatinBuilder::Types.types.each do |type|
        instance_variable_set("@#{type}_list", send(type))
        instance_variable_set("@#{type}_list_size", instance_variable_get("@#{type}_list").send(:size))
      end
    end

    def create_sentence(arg)
      args = if arg.kind_of? Hash
               arg
             elsif arg == :random
               { sbj: random_noun, obj: random_noun, pred: random_verb }
             end
      LLT::LatinBuilder::SentenceCreator.new(args)
    end

    private

    LLT::LatinBuilder::Types.types.each do |type|
      define_method "random_#{type}".to_sym do
        index = rand(instance_variable_get("@#{type}_list_size"))
        instance_variable_get("@#{type}_list")[index]
      end
    end
  end
end

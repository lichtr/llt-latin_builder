require "llt/latin_builder/version"

module LLT
  class LatinBuilder
    require 'llt/form_builder'
    require_relative 'latin_builder/helper'
    require_relative 'latin_builder/sentence_creator'
    include LLT::LatinBuilder::Helper

    def initialize(*types)
      @types = ["noun", "verb"]

      add_types(types)

      @types.each do |type|
        instance_variable_set("@#{type}_list", send(type))
        instance_variable_set("@#{type}_list_size", instance_variable_get("@#{type}_list").send(:size))
      end

      #create_random_methods
    end

    def create_random_sentence
      args = { sbj: random_noun, obj: random_noun, pred: random_verb }
      LLT::LatinBuilder::SentenceCreator.new(args)
    end

    private

    def add_types(types)
      unless types.empty?
        types.each do |t|
          @types << t
        end
        @types.uniq
      end
    end

    #def random_verb
    #  index = rand(@verb_list_size)
    #  @verb_list[index]
    #end

    #def random_noun
    #  index = rand(@noun_list_size)
    #  @noun_list[index]
    #end

    def create_random_methods
      @types.each do |type|
        LLT::LatinBuilder.define_method "random_#{type}".to_sym do
          index = rand(instance_variable_get("@#{type}_list_size"))
          instance_variable_get("@#{type}_list")[index]
        end
      end
    end
  end
end

module LLT
  class LatinBuilder
    class SentenceCreator
      require 'llt/form_builder'
      def initialize(opts)
        @sbj = opts[:sbj]
        @obj = opts[:obj]
        @pred = opts[:pred]

        @sbj_opts = { numerus: 1, casus: 1 }
        @obj_opts  = { numerus: 1, casus: 4 }
        @pred_opts = { persona: 3, numerus: 1, tempus: :praesens, genus: :activum, modus: :indicativus }

        @sbj_args  = { type: :noun, stem: @sbj.stem, nominative: @sbj.nom, inflection_class: @sbj.inflectable_class, sexus: @sbj.sexus, options: @sbj_opts }
        @pred_args = { type: :praesens, stem: @pred.pr_stem, inflection_class: @pred.inflectable_class, options: @pred_opts }
        @obj_args  = { type: :noun, stem: @obj.stem, nominative: @sbj.nom, inflection_class: @obj.inflectable_class, sexus: @obj.sexus, options: @obj_opts }
        require 'pry'; binding.pry
      end

      def build
        [@sbj_args, @obj_args, @pred_args].map do |word|
          LLT::FormBuilder.build(word)
        end.flatten
      end
    end
  end
end

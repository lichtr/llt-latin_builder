module LLT
  class LatinBuilder
    class SentenceCreator
      require 'llt/form_builder'
      def initialize(opts)
        @sbj = opts[:sbj]
        @obj = opts[:obj]
        @pred = opts[:pred]

        @pred_opts = { persona: 3, numerus: random_numerus, tempus: :praesens, genus: :activum, modus: :indicativus }
        @sbj_opts = { numerus: adapt_numerus_to_pred, casus: 1 }
        @obj_opts  = { numerus: 1, casus: 4 }

        @sbj_args  = { type: :noun, stem: @sbj.stem, nominative: @sbj.nom, inflection_class: @sbj.inflectable_class, sexus: @sbj.sexus, options: @sbj_opts }
        @pred_args = { type: :praesens, stem: @pred.pr_stem, inflection_class: @pred.inflectable_class, options: @pred_opts }
        @obj_args  = { type: :noun, stem: @obj.stem, nominative: @sbj.nom, inflection_class: @obj.inflectable_class, sexus: @obj.sexus, options: @obj_opts }
      end

      def build
        [@sbj_args, @obj_args, @pred_args].map do |word|
          LLT::FormBuilder.build(word)
        end.flatten
      end

      private

      def random_numerus
        rand(1..2)
      end

      def adapt_numerus_to_pred
        @pred_opts[:numerus]
      end
    end
  end
end

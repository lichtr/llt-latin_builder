module LLT
  class LatinBuilder
    module Types
      def self.types
        ["noun", "verb"]
      end

      def self.add_types(types)
        unless types.empty?
          types.each do |t|
            LLT::LatinBuilder::Types.types << t
          end
          LLT::LatinBuilder::Types.uniq
        end
      end

    end
  end
end

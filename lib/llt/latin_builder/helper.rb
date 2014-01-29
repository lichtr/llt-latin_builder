module LLT
  class LatinBuilder
    module Helper
      require 'llt/db_handler/prometheus'
      require_relative 'types'

      LLT::LatinBuilder::Types.types.each do |meth|
        define_method meth do
          const = "Db" + meth.capitalize
          entries.select { |type| type.instance_of? StemDatabase.const_get(const.to_sym) }
        end
      end

      private

      def db
        LLT::DbHandler::Prometheus.new
      end

      def entries
        db.all_entries
      end
    end
  end
end

module CTA
  module Redcarpet
    module CTARenderer
      TAG_REGEX = %r{\[cta:([^\]]+)\]}.freeze

      def preprocess(full_document)
        full_document.gsub! TAG_REGEX do |text|
          match_data = text.match(TAG_REGEX)

          scope.cta(match_data[1])
        end

        full_document
      end
    end
  end
end

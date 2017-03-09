module CTA
  class Instance
    attr_accessor :image, :url, :id

    def initialize(attributes = {})
      attributes.each do |key, value|
        self.public_send("#{ key }=", value)
      end
    end
  end
end

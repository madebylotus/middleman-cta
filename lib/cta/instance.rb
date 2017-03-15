module CTA
  class Instance
    attr_accessor :image, :url, :id

    def initialize(attributes = {})
      attributes.each do |key, value|
        self.public_send("#{ key }=", value)
      end
    end

    def url_for(sitemap)
      uri = URI(url)
      return url if uri.absolute?

      sitemap.find_resource_by_path(url)
    end
  end
end
